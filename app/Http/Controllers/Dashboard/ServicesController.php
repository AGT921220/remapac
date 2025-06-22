<?php

namespace App\Http\Controllers\Dashboard;

use App\Features\Notification\UseCases\SendPushNotification;
use App\Features\Service\UseCases\FetchServices;
use App\Models\DeviceToken;
use App\Models\Inventory;
use App\Models\Product;
use App\Models\Service;
use App\Models\ServiceDetail;
use App\Models\User;
use Illuminate\Http\Request;

class ServicesController
{
    private FetchServices $fetchServices;
    private SendPushNotification $sendPushNotification;
    public function __construct(FetchServices $fetchServices, SendPushNotification $sendPushNotification)
    {
        $this->fetchServices = $fetchServices;
        $this->sendPushNotification = $sendPushNotification;
    }
    public function index(Request $request)
    {
        $services = $this->fetchServices->__invoke();
        // return $services;

        return view('dashboard.services.index', [
            'services' => $services,
        ]);
    }
    public function create()
    {
        // Logic to show client creation form
        return view('dashboard.products.create');
    }
    public function store(Request $request)
    {
        $inventory = new Inventory();
        $inventory->product_id = request('product_id');
        $inventory->serial_number = request('serial_number');
        $inventory->save();
        return back()->with('success', 'Serie creada.');
    }
    public function action(Request $request)
    {
        $action = $request->input('action');
        $serviceId = $request->input('service_id');
        $service = Service::findOrFail($serviceId);
        $userTokens = $this->getUserTokens($service->user_id);
        if ($action === 'decline') {
            $service->status = 'declined';
            $service->decline_reason = $request->input('reason');
            $this->declineService($serviceId, $userTokens);
            $service->date_declined = now();
        }
        if ($action === 'accept') {
            $service->status = 'accepted';
            $this->acceptService($serviceId, $userTokens);
            $service->date_accepted = now();
        }
        $service->save();

        return back()->with('success', 'Acción realizada correctamente.');
    }
    private function declineService(int $serviceId, ?array $tokens = []): void
    {
        $inventories = ServiceDetail::select('inventory_id')
            ->where('service_id', $serviceId)
            ->get();
        Inventory::whereIn('id', $inventories->pluck('inventory_id'))
            ->update(['status' => 'available']);

        foreach ($tokens as $token) {
            $this->sendPushNotification->sendNotification(
                $token,
                'Servicio rechazado',
                "El servicio $serviceId ha sido rechazado.",
                'rejected-services'
            );
        }
    }
    private function acceptService(int $serviceId, ?array $tokens = []): void
    {
        $inventories = ServiceDetail::select('inventory_id')
            ->where('service_id', $serviceId)
            ->get();

        Inventory::whereIn('id', $inventories->pluck('inventory_id'))
            ->update(['status' => 'in_rental']);
        foreach ($tokens as $token) {
            $this->sendPushNotification->sendNotification(
                $token,
                'Servicio aceptado',
                "El servicio #$serviceId ha sido aceptado.",
                'accepted-services'
            );
        }
    }
    private function getUserTokens(int $userId): array
    {
        return DeviceToken::where('user_id', $userId)
            ->pluck('token')
            ->toArray();
    }
}
