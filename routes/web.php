<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\PostController;
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
        Route::post('/categories/create',[PostController::class,'store'])->name('create');
        Route::view('/categories/edit', 'category.edit')->name('edit');
        Route::view('/categories/show', 'category.show')->name('show');
        Route::view('/user', 'category')->name('user');
        Route::post('/categories/media',[PostController::class,'updateMedia'])->name('media');
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

