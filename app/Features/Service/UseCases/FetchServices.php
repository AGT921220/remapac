<?php

namespace App\Features\Service\UseCases;

use App\Models\Service;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class FetchServices
{
    public function __invoke(): Collection
    {
        return $this->getBaseQuery()
            ->get()
            ->transform(fn($service) => $this->transformService($service));
    }

    private function getBaseQuery(): Builder
    {
        return Service::select('services.id', 'services.user_id', 'services.status', 'users.name as client_name')
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
        $service->makeHidden('serviceDetails');
        return $service;
    }

    private function getStatusText(string $status): string
    {
        return match ($status) {
            'pending' => 'Pendiente',
            'in_progress' => 'En Progreso',
            'completed' => 'Completado',
            'cancelled' => 'Cancelado',
            default => 'Desconocido',
        };
    }

    private function getProducts($service): Collection
    {
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
            ->map(function ($items) {
                $first = $items->first();
                $quantity = $items->sum('quantity');
                return [
                    'id' => $first['id'],
                    'description' => $first['description'],
                    'brand' => $first['brand'],
                    'price' => $first['price'],
                    'quantity' => $quantity,
                    'total_price' => $quantity * $first['price'],
                    'image' => $first['image'],
                    'serial_numbers' => $items->pluck('serial_number')->implode(','),
                ];
            })
            ->values();
    }
}
