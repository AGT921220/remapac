<?php

namespace App\Features\Service\UseCases;

use App\Models\Service;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;
use Carbon\Carbon;
use Carbon\CarbonPeriod;

class FetchServices
{
    public function __invoke(?array $filters = []): Collection
    {
        $baseQuery = $this->getBaseQuery();

        if (isset($filters['status'])) {
            $baseQuery->where('services.status', $filters['status']);
        }
        if (isset($filters['user_id'])) {
            $baseQuery->where('services.user_id', $filters['user_id']);
        }
        return $baseQuery->get()
            ->transform(fn($service) => $this->transformService($service));
    }

    private function getBaseQuery(): Builder
    {
        return Service::select('services.id', 'services.user_id', 'services.status', 'users.name as client_name', 'services.date_start', 'services.date_end')
            ->join('users', 'users.id', '=', 'services.user_id')
            ->with([
                'serviceDetails.product:id,description,brand,price,image',
                'serviceDetails.inventory:id,serial_number'
            ]);
    }

    private function transformService($service)
    {
        $service->status_text = $this->getStatusText($service->status);
        $service->products = $this->getProducts($service);
        $service->total_price = $service->products->sum('total_price');
        $service->days = $service->products->first()['days'] ?? 0;
        $service->makeHidden('serviceDetails');
        return $service;
    }

    private function getStatusText(string $status): string
    {
        return match ($status) {
            'pending' => 'Pendiente',
            'declined' => 'Rechazado',
            'accepted' => 'Aceptado',
            'completed' => 'Completado',
            'cancelled' => 'Cancelado',
            default => 'Desconocido',
        };
    }

    private function getProducts($service): Collection
    {
        $startDate = $service->date_start;
        $endDate = $service->date_end;
        // Calcular los días omitiendo los domingos usando Carbon, incluyendo ambos extremos
        $days = 0;
        if ($startDate && $endDate) {
            $period = CarbonPeriod::create(Carbon::parse($startDate), '1 day', Carbon::parse($endDate));
            foreach ($period as $date) {
                if ($date->dayOfWeek !== Carbon::SUNDAY) {
                    $days++;
                }
            }
        }
        return collect($service->serviceDetails)
            ->map(fn($detail) => [
                'id' => $detail->product->id,
                'description' => $detail->product->description,
                'brand' => $detail->product->brand,
                'price' => $detail->product->price,
                'serial_number' => $detail->inventory->serial_number,
                'image' => $detail->product->image,
                'quantity' => 1,
            ])
            ->groupBy('id')
            ->map(function ($items) use ($days) {
                $first = $items->first();
                $quantity = $items->sum('quantity');
                $priceDay = $quantity * $first['price'];
                return [
                    'id' => $first['id'],
                    'description' => $first['description'],
                    'brand' => $first['brand'],
                    'price' => $first['price'],
                    'quantity' => $quantity,
                    'price_per_day' => $priceDay,
                    'days' => $days,
                    'total_price' => $days * $priceDay,
                    'image' => $first['image'],
                    'serial_numbers' => $items->pluck('serial_number')->implode(','),
                ];
            })
            ->values();
    }
}
