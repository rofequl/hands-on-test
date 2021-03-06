<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\BillController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/auth/login', [AuthController::class, 'login']);

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/auth/user', function(Request $request) {
        return auth()->user();
    });
    Route::post('/auth/logout', [AuthController::class, 'logout']);
    Route::resource('customer', CustomerController::class);
    Route::resource('bill', BillController::class);
    Route::post('bill-status-change', [BillController::class, 'billStatus']);

    Route::get('customer-bill', [BillController::class, 'customerBill']);
});
