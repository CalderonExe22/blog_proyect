<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Category;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $postRandom = Blog::inRandomOrder()->limit(1)->get();
        $randomPosts = Blog::inRandomOrder()->limit(7)->get();
        $categories =  Category::get();
        return view('home', ['postRandom' => $postRandom,'posts' => $randomPosts,'categories'=>$categories]);
    }

}
