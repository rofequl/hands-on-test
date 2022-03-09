<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{

    public function login(Request $request): \Illuminate\Http\JsonResponse
    {
        $attr = $request->validate([
            'email' => 'required|string|email|',
            'password' => 'required|string|min:6'
        ]);

        if (!Auth::attempt($attr)) {
            return response()->json(['message' => 'Email and password are not match'], 401);
        }

        return $this->respondWithToken(auth()->user()->createToken('API Token')->plainTextToken);

    }

    public function logout()
    {
        auth()->user()->tokens()->delete();

        return response()->json(['message' => 'Successfully logged out']);
    }


}
