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
        if ($request->type === 'user') {
            if (!Auth::guard('users')->attempt($attr)) {
                return response()->json(['message' => 'Email and password are not match1'], 401);
            }
            return $this->respondWithToken(auth('users')->user()->createToken('API Token')->plainTextToken);
        } else {
            if (!Auth::guard('customers')->attempt($attr)) {
                return response()->json(['message' => 'Email and password are not match2'], 401);
            }
            return $this->respondWithToken(auth('customers')->user()->createToken('API Token')->plainTextToken);
        }

    }

    public function logout(Request $request)
    {
        auth()->user()->tokens()->delete();
        return response()->json(['message' => 'Successfully logged out']);
    }


}
