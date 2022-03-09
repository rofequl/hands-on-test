<?php

namespace App\Traits;

use Carbon\Carbon;

/*
|--------------------------------------------------------------------------
| Api Responser Trait
|--------------------------------------------------------------------------
|
| This trait will be used for any response we sent to clients.
|
*/

trait ApiResponser
{
    
    protected function success($data, string $message = null, int $code = 200): \Illuminate\Http\JsonResponse
    {
        return response()->json([
            'status' => 'Success',
            'message' => $message,
            'data' => $data
        ], $code);
    }
    
    protected function error(string $message = null, int $code, $data = null): \Illuminate\Http\JsonResponse
    {
        return response()->json([
            'status' => 'Error',
            'message' => $message,
            'data' => $data
        ], $code);
    }

}
