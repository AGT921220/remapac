<?php

namespace App\Http\Controllers\Api;

use App\Models\Inventory;
use App\Models\Product;
use App\Models\Service;
use App\Models\ServiceDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ServiceController
{
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $serviceId = $this->createService(Auth::id());
            $this->createServiceDetails($serviceId, $request->input('items', []));
            DB::commit();
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            return response()->json(['error' => $e->errors()], 422);
        }

        return response()->json(['data' => $request->all(),'success' => true, 'service_id' => $serviceId], 201);
    }
    private function createService(int $userId): int
    {
        $service = new Service();
        $service->user_id = $userId;
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

        ServiceDetail::insert($dataToInsert);
        info($inventoriesToBlock);
        Inventory::whereIn('id', $inventoriesToBlock)->update(['status' => 'blocked']);
    }
}
