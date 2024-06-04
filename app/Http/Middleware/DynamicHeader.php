<?php

namespace App\Http\Middleware;

use App\Models\Menu;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class DynamicHeader
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $menus = [];
        if(Auth::check()){
            $user = Auth::user();
            $roles = $user->roles;
            $menus = Menu::whereHas('roles', function($query) use ($roles){
                $query->whereIn('roles.id', $roles->pluck('id'));
            })->with('children')->whereNull('id_padre')->get();
        }
        view()->share('menus', $menus);
        return $next($request);
    }
}
