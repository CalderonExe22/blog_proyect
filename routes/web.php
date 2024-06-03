<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\MenuController;
use Illuminate\Auth\Events\Login;
use Illuminate\Support\Facades\Route;

Route::view('/', 'home')->name("home");

Route::view('/deshboard','deshboard')->name('deshboard');

Route::view('/login', 'auth.login')->name("login");

Route::view("/categories","category.index")->name("categories");

Route::post('/login', [LoginController::class,'Login']);

//Route::get('/menus', [MenuController::class, 'index'])->middleware('auth');

