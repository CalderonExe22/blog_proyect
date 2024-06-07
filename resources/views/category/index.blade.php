<x-layouts.app title-page="categorias" class="app">
    <div class="py-48 px-16">
        <form id="categoryForm" action="{{ route('category.filter') }}" method="GET">
            <label for="categorySelect">Select Category:</label>
            <div name="category" id="category">
                @foreach ($categories as $category)
                    <div>
                        <input type="checkbox" name="categories[]" value="{{ $category->id }}" id="category_{{ $category->id }}" {{ in_array($category->id, $selectedCategories) ? 'checked' : '' }}>
                        <label for="category_{{ $category->id }}">{{ $category->name }}</label>
                    </div>
                @endforeach
            </div>
            <input type="submit" value="filtrar">
        </form>
        <a href="{{ route('category.index') }}">Limpiar</a>
        <div>
            @foreach ($posts as $post)
                <h1 class="text-black">{{ $post->title }}</h1><br>
            @endforeach
        </div>
    </div>
</x-layouts.app>