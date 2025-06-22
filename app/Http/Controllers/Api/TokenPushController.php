<?php

namespace App\Http\Controllers\Api;

use App\Models\DeviceToken;
use App\Models\Inventory;
use App\Models\Product;
use App\Models\Project;
use App\Models\Service;
use App\Models\ServiceDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TokenPushController
{
    public function store(Request $request)
    {
        $userId = Auth::id();
        info($request->all());
        DeviceToken::updateOrCreate(
            ['token' => $request->input('token')],
            [
                'user_id' => $userId,
                //             'device' => $deviceType
            ]
        );
        return response()->json(['message' => 'Token stored successfully'], 200);
    }
}
