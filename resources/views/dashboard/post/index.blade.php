
<x-layouts.app>
    <div class="pt-48 px-48">
        @method('DELETE')
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
            <form action="{{ route('delete', ['post' => $post->id]) }}" method="POST" style="display:inline;">
                @csrf
                @method('DELETE')
                <button type="submit" onclick="return confirm('¿Estás seguro de que deseas eliminar este post?')">Eliminar</button>
            </form>
            <img src="{{ asset('storage/image2/' . $post->cover_image) }}" alt="">
            <a href="{{ route('post.edit', ['post' => $post->id]) }}">ver</a>
        @endforeach
    </div>
</x-layouts.app>