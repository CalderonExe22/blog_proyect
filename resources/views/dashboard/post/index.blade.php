
<x-layouts.dashboard>
    <div class="pt-28 ps-16">
        <h1 class="text-5xl font-bold mb-28">Mis post</h1>
        @if (@session('success'))   
            <div class="py-16">
                <span class="font-semibold">{{ session('success') }}</span>
            </div> 
        @endif()
        <div class="grid grid-cols-4 gap-8">
            <div class="text-center">
                <h1 class="text-2xl font-semibold">Titulos post</h1>
            </div>
            <div class="text-center">
                <h1 class="text-2xl font-semibold">Descripcion del post</h1>
            </div>
            <div class="text-center">
                <h1 class="text-2xl font-semibold">imagen portada</h1>
            </div>
            <div class="text-center">
                <h1 class="text-2xl font-semibold">Administrar post</h1>
            </div>
            @foreach ($posts as $post)
                <div class="flex justify-center items-center">
                    <h1>{{ $post->title }}</h1>
                </div>
                <div class="flex justify-center items-center">
                    <h1>{{ $post->description }}</h1>
                </div>
                <div class="flex justify-center items-center">
                    <img src="{{ asset('storage/image2/'.$post->cover_image.'') }}" alt="" srcset="">
                </div>
                <div class="flex justify-center items-center gap-10">
                    <a class="hover:text-indigo-500 transition-all" href="{{ route('show',$post->id) }}">Ver</a>
                    @if ($post->trashed())
                        <form action="{{ route('restore',$post->id) }}" method="post" onsubmit="return confirm('¿Estás seguro de que deseas restaurar este post?');">
                            @csrf
                            @method('PATCH')
                            <input class="cursor-pointer hover:text-green-700 transition-all" type="submit" value="Restaurar">
                        </form>
                    @else
                    <form action="{{ route('delete',$post->id) }}" method="post" onsubmit="return confirm('¿Estás seguro de que deseas eliminar este post?');">
                        @csrf
                        @method('DELETE')
                        <input class="cursor-pointer hover:text-red-700 transition-all" type="submit" value="Eliminar">
                    </form>
                    @endif
                    <a class="cursor-pointer hover:text-yellow-500 transition-all" href="{{ route('post.edit', ['post' => $post->id]) }}">Editar</a>
                </div>
            @endforeach
        </div>
    </div>
</x-layouts.dashboard>