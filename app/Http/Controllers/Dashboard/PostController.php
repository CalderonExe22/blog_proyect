<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PostController extends Controller
{

    public function index()
    {
        $posts = Blog::withTrashed()->get();
        return view('dashboard.post.index',['posts'=>$posts]);
    }

    public function create()
    {
        $categories = Category::get();
        return view('dashboard.post.create',['categories'=>$categories]);
    }

    public function show(Blog $post)
    {
        return view('dashboard.post.show',['post'=>$post]);
    }

    public function store(Request $request){
        $request->validate([
            'title' => 'required',
            'location' => 'required',
            'description' => 'required',
            "content" => 'required',
            'category_id' => 'required|exists:categories,id',
            'cover_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);
        $blog = new Blog;
        $blog->title = $request->input('title');
        $blog->description = $request->input('description');
        $blog->location = $request->input('location');
        $blog->category_id = $request->input('category_id');
        $blog->content = $request->input('content');
        if($request->hasFile('cover_image')){
            $file = $request->cover_image;
            $fileNameWithExt = $file->getClientOriginalName();
            $file_name = pathinfo($fileNameWithExt, PATHINFO_FILENAME);
            $file_extension = $file->getClientOriginalExtension();
            $file_name_to_store = $file_name.'.'.time().'.'.$file_extension;
            $file->storeAs('public/image2/', $file_name_to_store);
            // Asigna el nombre del archivo guardado al campo cover_image
            $blog->cover_image = $file_name_to_store;
        } else {
            $blog->cover_image = null;
        }
        $blog->save();
        return to_route('post.index')->with('success', 'Post creado correctamente');
    }

    public function edit(Blog $post)
    {
        $categories = Category::get();
        return view('dashboard.post.edit' , ['post'=>$post,'categories'=>$categories]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'location' => 'required',
            'description' => 'required',
            "content" => 'required',
            'category_id' => 'required|exists:categories,id',
            'cover_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
        ]);
        $blog = Blog::findOrFail($id);
        $blog->title = $request->input('title');
        $blog->description = $request->input('description');
        $blog->location = $request->input('location');
        $blog->category_id = $request->input('category_id');
        $blog->content = $request->input('content');
        if($request->hasFile('cover_image')){
            if($blog->cover_image){
                $oldImagePath = public_path('public/image2/' . $blog->cover_image);
                if(file_exists($oldImagePath)){
                    unlink($oldImagePath);
                }
            }
            $file = $request->cover_image;
            $fileNameWithExt = $file->getClientOriginalName();
            $file_name = pathinfo($fileNameWithExt, PATHINFO_FILENAME);
            $file_extension = $file->getClientOriginalExtension();
            $file_name_to_store = $file_name.'.'.time().'.'.$file_extension;
            $file->storeAs('public/image2/', $file_name_to_store);
            // Asigna el nombre del archivo guardado al campo cover_image
            $blog->cover_image = $file_name_to_store;
        }
        $blog->save();
        return to_route('post.index')->with('success', 'Post actualizado correctamente');
    }

    public function delete(Blog $post)
    {
        $post->delete();
        return to_route('post.index')->with('success', 'Post deshabilitado');
    }

    public function restore($post)
    {
        $postRestore = Blog::withTrashed()->findOrFail($post);
        $postRestore->restore();
        return to_route('post.index')->with('success', 'Post restaurado');
    }

    public function updateMedia(Request $request){
        if($request->hasFile('image')){
            try{
                $file = $request->image;
                $fileNameWithExt = $file->getClientOriginalName();
                $file_name = pathinfo($fileNameWithExt, PATHINFO_FILENAME);
                $file_extension = $file->getClientOriginalExtension();
                $file_name_to_store = $file_name.'.'.time().'.'.$file_extension;
                
                // Guardar el archivo en la ruta de almacenamiento pública
                $file->storeAs('public/image/', $file_name_to_store);

                // Construir la URL de la imagen
                $image_preview_path = asset('storage/image/' . $file_name_to_store);

                // Respuesta en el formato esperado por Editor.js
                return response()->json([
                    "success" => 1,
                    "file" => [
                        "url" => $image_preview_path,
                    ]
                ]);
            }catch(\Exception $e){
                Log::error('Error uploading file: ' . $e->getMessage());
                return response()->json([
                    "success" => 0,
                    "error" => [
                        "message" => "Error uploading file"
                    ]
                ], 500);
            }
        }
        return response()->json([
            "success" => 0,
            "error" => [
                "message" => "No file uploaded"
            ]
        ], 400);
    }
}
