<x-layouts.app class-main="flex " title-page="categorias" class="app">

    <x-slot:header></x-slot:header>
    
    <div class="flex flex-col gap-10 py-48 px-16 w-[550px] h-full">
        <form id="categoryForm" action="{{ route('category.filter') }}" method="GET">
            <div class="flex flex-col gap-10" name="category" id="category">
                <label for="categorySelect">Seleccionar Categoria:</label>
                @foreach ($categories as $category)
                    <div>
                        <input type="checkbox" name="categories[]" value="{{ $category->id }}" id="category_{{ $category->id }}" {{ in_array($category->id, $selectedCategories) ? 'checked' : '' }}>
                        <label for="category_{{ $category->id }}">{{ $category->name }}</label>
                    </div>
                @endforeach
                <a href="{{ route('category.index') }}">Limpiar</a>
            </div>
            <input class="mt-10" type="submit" value="filtrar">
        </form> 
    </div>

    <div class="grid grid-cols-4 gap-10 px-16 pt-48">
        @foreach ($posts as $post)
            <div class="flex flex-col rounded-md">
                <div class="h-[400px]">
                    <img class="object-cover h-full rounded-md" src="{{ asset('storage/image2/'.$post->cover_image.'') }}" alt="">
                </div>
                <div class="flex flex-col gap-8 text-center py-10">
                    <h1 class="font-semibold text-xl text-black">{{ $post->title }}</h1>
                    <p class="">{{ $post->description }}</p>
                    <a class="cursor-pointer p-2 transition-all hover:text-indigo-500" href="{{ route('show',$post->id) }}">Ver post</a>
                </div>       
            </div>
        @endforeach
    </div>
</x-layouts.app>