
@push('scripts')
    @vite(['resources/js/editor.js'])
@endpush
<x-layouts.dashboard title-page="crear posts">
    <form enctype="multipart/form-data" data-media="media" class="w-full" method="POST" action="{{ route('store') }}" > 
        @csrf
        <input type="hidden" name="content" id="content">
        <x-form.formPost 
            title-form="Crear post" 
            :categories="$categories"
            boton="Crear post"/>
    </form>
</x-layouts.dashboard>
