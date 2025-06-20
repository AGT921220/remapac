<?php

namespace App\Http\Controllers\Dashboard;

use App\Features\Service\UseCases\FetchServices;
use App\Models\Inventory;
use App\Models\Product;
use App\Models\Service;
use App\Models\User;
use Illuminate\Http\Request;

class ServicesController
{
    private FetchServices $fetchServices;
    public function __construct(FetchServices $fetchServices)
    {
        $this->fetchServices = $fetchServices;
    }
    public function index()
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
}
