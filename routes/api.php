<?php

use App\Http\Controllers\Api\AuthController as ApiAuthController;
use App\Http\Controllers\Api\AvaibalbeProductsController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Rutas públicas

Route::get('/test', [ApiAuthController::class, 'test']);
Route::post('/login', [ApiAuthController::class, 'login']);
Route::post('/register', [ApiAuthController::class, 'register']);
// Route::get('/available-products', [AvaibalbeProductsController::class, 'index']);


// Rutas protegidas con Sanctum middleware
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('/logout', [ApiAuthController::class, 'logout']);

    Route::get('/available-products', [AvaibalbeProductsController::class, 'index']);
    Route::resource('services', ServiceController::class);

    // Aquí otras rutas protegidas, ej.:
    // Route::resource('clients', ClientController::class);
});
