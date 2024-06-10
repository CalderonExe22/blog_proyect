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
