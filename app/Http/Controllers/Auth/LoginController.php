<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException as ValidationValidationException;
use League\Config\Exception\ValidationException;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $user = Auth::user();
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);
        if(Auth::attempt($request->only('email','password'))){
            $request->session()->regenerate();
            return to_route('home');
        }
        throw ValidationValidationException::withMessages([
            'noRegister' => 'email no valido',
        ]);
        
    } 

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return to_route("home");
    }
}
