<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Inventory;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class InventoryController
{
    public function index()
    {
        $products = Product::get();
        // Logic to list products
        return view('dashboard.products.index', [
            'products' => $products,
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
}
