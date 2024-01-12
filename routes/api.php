<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\LandController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::prefix('v1')->group(function() {
    Route::prefix('auth')->group(function() {
        Route::post('register',[AuthController::class, 'register']);
        Route::post('login  ',[AuthController::class, 'login']);
        Route::get("user", [AuthController::class, 'user']);
        Route::post("logout", [AuthController::class, 'logout']);

    });

    Route::prefix('land')->group(function() {
        Route::get("get", [LandController::class, 'get_all_land']);
        Route::post('create',[LandController::class, 'create_land']);
        Route::post('photo',[LandController::class, 'add_photo_land']);
        Route::post('rating',[LandController::class, 'land_rating']);
        Route::post('landowner/register',[LandController::class, 'register_as_landowner']);
    });
})->middleware('api');
