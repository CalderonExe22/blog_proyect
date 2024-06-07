@push('scripts')
    @vite(['resources/js/update-editor.js'])
@endpush
<x-layouts.app class-main="pt-28">
    <div class="container">
        <h1>Edit Post</h1>
        <form action="{{ route('update',['post' => $post->id]) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group">
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
                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>
                <input type="hidden" id="editorData" name="content" value="{{ old('content',$post->content) }}">
                <input type="file" id="cover_image" name="cover_image">
                <div id="editorjs"></div>
            </div>
            <input type="submit" ed>
        </form>
    </div>
</x-layouts.app>