<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\User;
use Illuminate\Http\Request;

class ClientController
{
    public function index()
    {
        $clients = User::where('role', User::ROLE_CLIENT)->get();
        // Logic to list clients
        return view('dashboard.clients.index', [
            'clients' => $clients,
        ]);
    }
    public function create()
    {
        // Logic to show client creation form
        return view('dashboard.clients.create');
    }
    public function store(Request $request)
    {
        if (User::where('email', request('email'))->exists()) {
            return redirect()->back()->withErrors(['email' => 'El correo electrónico ya está en uso.']);
        }
        if ($request->input('password') !== $request->input('password_confirmation')) {
            return redirect()->back()->withErrors(['password' => 'Las contraseñas no coinciden.']);
        }

        $user = new User();
        $user->name = request('name');
        $user->email = request('email');
        $user->password = bcrypt(request('password'));
        $user->role = User::ROLE_CLIENT;
        $user->save();
        return redirect()->route('clients.index')->with('success', 'Cliente creado.');
    }
}
