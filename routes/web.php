<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Dashboard\CategoryController;
use App\Http\Controllers\Dashboard\HomeController;
use App\Http\Controllers\Dashboard\PostController;
use App\Http\Middleware\DynamicHeader;
use Illuminate\Support\Facades\Route;

// Rutas públicas
//Route::view('/', 'home')->name('home');
Route::get('/',[HomeController::class,'index'])->name('home');
Route::view('/login', 'auth.login')->name('login');
Route::post('/login', [LoginController::class, 'login']);
// Rutas protegidas por el middleware de autenticación y DynamicHeader
Route::middleware([DynamicHeader::class])->group(function () {

    Route::get('/',[HomeController::class,'index'])->name('home');
    Route::get('/logout', [LoginController::class, 'logout'])->name('logout');
    Route::get('/categories', [CategoryController::class,'index'])->name('category.index');
    Route::get('/categories/filter',[CategoryController::class,'filter'])->name('category.filter');
    Route::get('/post/show/{post}', [PostController::class,'show'])->name('show');

    Route::middleware(['auth', 'role:autor'])->group(function(){
        Route::get('/post',[PostController::class,'index'])->name('post.index');
        Route::get('/post/create', [PostController::class,'create'])->name('create');
        Route::post('/post/store',[PostController::class,'store'])->name('store');
        Route::view('/post/edit', 'dashboard.post.edit')->name('edit');
        Route::get('/post/edit/{post}', [PostController::class,'edit'])->name('post.edit');
        Route::put('/post/update/{post}',[PostController::class,'update'])->name('update');
        Route::delete('/post/delete/{post}',[PostController::class,'delete'])->name('delete');
        Route::patch('/post/restore/{post}',[PostController::class,'restore'])->name('restore');
        Route::post('/post/media',[PostController::class,'updateMedia'])->name('media');
    });

});
