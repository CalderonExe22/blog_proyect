<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {   
        $posts = Blog::whereNull('deleted_at')->get();
        $categories = Category::get();
        return view('category.index',['posts'=>$posts,'categories'=>$categories,'selectedCategories'=>[]]);
    }

    public function filter(Request $request)
    {
        $selectedCategories = $request->input('categories',[]);
        $categories = Category::get();
        if(empty($selectedCategories)){
            $posts = Blog::whereNull('deleted_at')->get();
        }else{
            $posts = Blog::whereIn('category_id', $selectedCategories)->get();
        }
        
        return view('category.index', [
            'posts'=>$posts,
            'categories'=>$categories, 
            'selectedCategories' => $selectedCategories
        ]);
    }

}
