<?php

namespace App\Http\Controllers\Api;

use App\Features\Service\UseCases\FetchServices;
use App\Models\Inventory;
use App\Models\Product;
use App\Models\Service;
use App\Models\ServiceDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ServiceController
{
    private FetchServices $fetchServices;
    public function __construct(FetchServices $fetchServices)
    {
        $this->fetchServices = $fetchServices;
    }

    public function index(Request $request)
    {

        $request->merge(['user_id' => Auth::id()]);
        $services = $this->fetchServices->__invoke($request->all());

        return response()->json(['data' => $services, 'success' => true], 200);
    }
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $serviceId = $this->createService(Auth::id(), $request->input('selected_project'), $request->input('start_date'), $request->input('end_date'));
            $this->createServiceDetails($serviceId, $request->input('items', []));
            DB::commit();
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            return response()->json(['error' => $e->errors()], 422);
        }

        return response()->json(['data' => $request->all(), 'success' => true, 'service_id' => $serviceId], 201);
    }
    private function createService(int $userId, int $projectId, string $dateStart, string $dateEnd): int
    {
        $service = new Service();
        $service->user_id = $userId;
        $service->date_start = $dateStart;
        $service->date_end = $dateEnd;
        $service->project_id = $projectId;
        $service->save();
        return $service->id;
    }
    private function createServiceDetails(int $serviceId, array $products): void
    {
        $dataToInsert = [];
        $inventoriesToBlock = [];
        foreach ($products as $product) {

            $inventories = Inventory::select('id')->where('product_id', $product['id'])
                ->where('status', 'available')
                ->limit($product['quantity'])
                ->get();
            if (!$inventories->isEmpty()) {
                foreach ($inventories as $inventory) {
                    $inventoriesToBlock[] = $inventory->id;
                    $dataToInsert[] = [
                        'service_id' => $serviceId,
                        'product_id' => $product['id'],
                        'inventory_id' => $inventory->id,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
                }
            }
        }
        // info($dataToInsert);
        ServiceDetail::insert($dataToInsert);
        Inventory::whereIn('id', $inventoriesToBlock)->update(['status' => 'blocked']);
    }
}
