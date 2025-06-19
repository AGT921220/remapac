<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController
{
    public function test()
    {
        return response()->json(['message' => 'API is working']);
    }
    public function login(Request $request)
    {
        info($request->all()); // Log the request data for debugging
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);
        info(1);
        if (!Auth::attempt($credentials)) {
            info(2);
            return response()->json(['error' => 'Credenciales inválidas'], 401);
        }

        $user = Auth::user();
        $token = $user->createToken('api-token')->plainTextToken;
        info('Token created: ' . $token);
        return response()->json(['access_token' => $token]);
    }
}
