<?php

namespace App\Http\Controllers\Api;

use App\Models\Inventory;
use App\Models\Product;
use App\Models\Project;
use App\Models\Service;
use App\Models\ServiceDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProjectController
{
    public function index(Request $request)
    {
        try {
            $client_id = Auth::id();
            $projects = Project::
            select('id','client_id', 'name', 'responsable', 'ubicacion')
            ->where('client_id', $client_id)
                ->get();

            return response()->json(['data' => $projects, 'success' => true], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error fetching projects: ' . $e->getMessage()], 500);
        }

    }
}
