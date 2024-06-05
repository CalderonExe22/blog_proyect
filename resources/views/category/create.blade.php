
@push('scripts')
    @vite(['resources/js/editor.js'])
@endpush
<x-layout.layout class-main="flex justify-center items-center h-screen w-full">
    <form data-media="media" ="" class="flex flex-col w-full" method="POST" action="{{ route('create') }}" > 
        @csrf
        <input type="text" id="title" name="title">
        <input type="hidden" name="content" id="content">
        <div class="bg-red-100 w-full" id="editorjs"></div>
        <input  type="submit" value="Subir">
    </form>
</x-layout.layout>