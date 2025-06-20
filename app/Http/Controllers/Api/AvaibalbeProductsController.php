<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AvaibalbeProductsController
{
    public function test()
    {
        return response()->json(['message' => 'API is working']);
    }
    public function index(Request $request)
    {
        $search = $request->input('search', '');

        $products = Product::
        select('id', 'brand', 'description', 'price', 'width', 'image')
        ->selectRaw('EXISTS (SELECT 1 FROM inventories WHERE inventories.product_id = products.id AND inventories.status = "available") as has_inventory')
        ->selectRaw('(SELECT COUNT(*) FROM inventories WHERE inventories.product_id = products.id AND inventories.status = "available") as inventory_count')
        ->with(['inventory' => function ($query) {
            $query->select('id', 'product_id', 'serial_number')
            ->where('status', 'available');
        }])
        ->where(function ($query) use ($search) {
            $query->where('brand', 'like', '%' . $search . '%')
              ->orWhere('description', 'like', '%' . $search . '%');
        })
        ->orderByDesc('has_inventory')
        ->orderBy('description')
        // ->orderBy('inventory_count')
        ->get();
        return response()->json(['data' => $products]);
    }
}
