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
        ->selectRaw('EXISTS (SELECT 1 FROM inventories WHERE inventories.product_id = products.id) as has_inventory')
        ->selectRaw('(SELECT COUNT(*) FROM inventories WHERE inventories.product_id = products.id) as inventory_count')
        ->with(['inventory' => function ($query) {
            $query->select('id', 'product_id', 'serial_number');
        }])
        ->where('brand', 'like', '%' . $search . '%')
        ->orWhere('description', 'like', '%' . $search . '%')
        ->get();
        return response()->json(['data' => $products]);
    }
}
