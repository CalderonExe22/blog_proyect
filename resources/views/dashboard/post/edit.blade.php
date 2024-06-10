@push('scripts')
    @vite(['resources/js/update-editor.js'])
@endpush
<x-layouts.dashboard class-main="pt-28">
    <div class="container">
        <form enctype="multipart/form-data" action="{{ route('update',['post' => $post->id]) }}" method="POST">
            @csrf
            @method('PUT')
            <input type="hidden" id="editorData" name="content" value="{{ old('content',$post->content) }}">
            <x-form.formPost 
                title-form="Editar post" 
                :categories="$categories"
                :post="$post"
                placeholder-title=" ingrese un nuevo titulo"
                placeholder-description=" ingrese un nuevo titulo"
                placeholder-location="Ingrese ubicacion geografica"
                boton="Editar post"
                />
        </form>
    </div>
    
</x-layouts.dashboard>

<!--<div class="form-group">
    <input type="text" id="title" name="title" placeholder="{{ $post->title }}"><br>
    @foreach ($categories as $category)
        @if ($category->id === $post->id)
            <input type="text" value="{{ $category->name }}">
        @endif
    @endforeach
    <div>
        <label for="category_id">Category:</label>
        <select id="category_id" name="category_id" required>
            @foreach($categories as $category)
            <option value="{{ $category->id }}" {{ old('category_id', $post->category_id) == $category->id ? 'selected' : '' }}>
                {{ $category->name }}
            </option>
            @endforeach
        </select>
    </div>
    <input type="hidden" id="editorData" name="content" value="{{ old('content',$post->content) }}">
    <input type="file" id="cover_image" name="cover_image">
    <div id="editorjs"></div>
</div>
<input type="submit" ed>-->