
<x-layouts.app class-main="px-96">

    <x-slot:header></x-slot:header>

    <div class="flex flex-col pt-48">
        @php
            $blocks = json_decode($post->content);
        @endphp
            @foreach ($blocks->blocks as $block)
                @if($block->type == 'header')
                    <h1 class="text-5xl mb-5">{!! html_entity_decode($block->data->text) !!}</h1>
                @elseif ($block->type == 'paragraph')
                    <p class="mb-2">{!! html_entity_decode($block->data->text) !!}</p>
                @elseif ($block->type == 'image')
                    <div class="w-full h-[700px] my-10">
                        <img class="object-cover w-full h-full" src="{{ $block->data->file->url }}" alt="Image"><br>
                    </div>
                @endif
        @endforeach
    </div>
</x-layouts.app>