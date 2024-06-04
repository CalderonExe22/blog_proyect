<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\CategoryController;
use App\Http\Middleware\DynamicHeader;
use Illuminate\Support\Facades\Route;

// Rutas públicas
Route::view('/', 'home')->name('home');
Route::view('/login', 'auth.login')->name('login');
Route::post('/login', [LoginController::class, 'login']);
// Rutas protegidas por el middleware de autenticación y DynamicHeader
Route::middleware([DynamicHeader::class])->group(function () {
    Route::view('/', 'home')->name('home');
    Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

    Route::middleware(['auth', 'role:autor'])->group(function(){
        Route::view('/dashboard', 'dashboard')->name('dashboard');
        Route::view('/categories', 'category.index')->name('categories');
        Route::view('/categories/create', 'category.create')->name('create');
        Route::view('/categories/update', 'category.edit')->name('update');
        Route::view('/categories', 'category.show')->name('delete');
        Route::view('/user', 'category.show')->name('user');
    });

    Route::middleware(['auth', 'role:view'])->group(function(){
        // Aquí puedes definir las rutas que requieren el rol "view"
    });
});

/*Route::middleware(['auth','role:autor'])->group(function(){
    Route::view('/dashboard', 'dashboard')->name('dashboard');
});
Route::middleware(['auth','role:view'])->group(function(){
    Route::view('/dashboard', 'dashboard')->name('dashboard');
});*/
//Route::get('/menu', [MenuController::class, 'index'])->middleware('auth');

