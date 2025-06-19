<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class ProductController
{
    public function index()
    {
        $products = Product::
        with(['inventory' => function ($query) {
            $query->select('id', 'product_id', 'serial_number');
        }])
        ->get();
        $products->each(function ($product) {
            $product->serial_numbers = $product->inventory->pluck('serial_number')->toArray();
        });
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

        $product = new Product();
        $product->brand = request('brand');
        $product->description = request('description');
        $product->price = request('price');
        $product->width = request('width');

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '_' . $image->getClientOriginalName();
            $image->move(public_path('images/products'), $imageName);
            $product->image = 'images/products/' . $imageName;
        }

        $product->save();

        return redirect()->route('products.index')->with('success', 'Producto creado.');
    }
}
