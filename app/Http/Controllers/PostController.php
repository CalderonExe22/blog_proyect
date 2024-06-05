<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PostController extends Controller
{
    public function store(Request $request){
        $validateData = $request->validate([
            'title' => 'required|max:100',
            'content' => 'required',
        ]);
        $blog = new Blog;
        $blog->title = $request->input('title');
        $blog->content = $request->input('content');
        $blog->save();
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
