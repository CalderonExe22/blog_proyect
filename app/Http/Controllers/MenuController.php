<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use function Pest\Laravel\get;

class MenuController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $roles = $user->roles()->pluck('roles.id')->toArray();
        $menus = Menu::whereHas('roles', function ($query) use ($roles) {
            $query->whereIn('roles.id', $roles);
        })->whereNull('id_padre')->with('children')->get();
        return view('components.partials.header', compact('menus'));
    }
}
