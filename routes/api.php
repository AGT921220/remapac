<?php

use App\Http\Controllers\Api\AuthController as ApiAuthController;
use App\Http\Controllers\Api\AvaibalbeProductsController;
use App\Http\Controllers\Api\ProjectController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Controllers\Api\TokenPushController;
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
    Route::resource('services', ServiceController::class)->only(['index', 'store']);

        // Rutas para el controlador de proyectos
        // Solo se permite el método index para obtener la lista de proyectos
    Route::resource('projects', ProjectController::class)->only(['index']);


        Route::resource('token-push', TokenPushController::class)->only(['store']);


    // Aquí otras rutas protegidas, ej.:
    // Route::resource('clients', ClientController::class);
});
