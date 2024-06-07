
@push('scripts')
    @vite(['resources/js/editor.js'])
@endpush
<x-layouts.dashboard>
    <form enctype="multipart/form-data" data-media="media" class="w-full" method="POST" action="{{ route('store') }}" > 
        @csrf
        <input type="text" id="title" name="title">
        <input type="hidden" name="content" id="content">
        <div>
            <label for="category_id">Category:</label>
            <select id="category_id" name="category_id" required>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                @endforeach
            </select>
        </div>
        <input type="file" id="cover_image" name="cover_image">
        <!-- editor.js -->
        <div class="bg-red-100" id="editorjs"></div>
        <input  type="submit" value="Subir">
    </form>
</x-layouts.dashboard>