<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Project;
use App\Models\User;
use Illuminate\Http\Request;

class ProjectController
{
    public function index(Request $request)
    {
        $clientId = $request->route('client');
        $projects = Project::select('projects.name', 'projects.ubicacion', 'projects.responsable', 'projects.telefono','projects.id')
            ->join('users', 'users.id', '=', 'projects.client_id')
            ->where('users.id', $request->route('client'))
            ->get();
        return view('dashboard.projects.index', compact('projects', 'clientId'));
    }
    public function store(Request $request)
    {
        $project = new Project();
        $project->name = $request->input('name');
        $project->ubicacion = $request->input('ubicacion');
        $project->responsable = $request->input('responsable');
        $project->telefono = $request->input('telefono');
        $project->client_id = $request->input('client_id');
        $project->save();
        return back()->with('success', 'Proyecto creado.');
    }
}
