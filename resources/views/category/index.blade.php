@push('scripts')
    @vite(['resources/js/editor.js'])
@endpush
<x-layout.layout>
    <div class="pt-48 px-48">
        @foreach ($posts as $post )
            @php
                $blocks = json_decode($post->content);
            @endphp
            @foreach ($blocks->blocks as $block)
                @if ($block->type == 'paragraph')
                    <p>{{ $block->data->text }}</p><br>
                @elseif ($block->type == 'image')
                    <img class="" src="{{ $block->data->file->url }}" alt="Image"><br>
                @endif
            @endforeach
        @endforeach
    </div>
</x-layout.layout>