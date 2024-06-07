
<div class="{{ $className ?? '' }}">
    <div class="flex flex-col justify-left ps-10 gap-16 pt-28 h-auto w-[350px]">
        <h1 class="text-3xl">Bienvenido: {{ $nameUser ?? "" }}</h1>
        <ul class="flex flex-col gap-10 w-full">
            <li><a class="py-4 ps-2 border-s-4 border-color: transparent hover:border-s-indigo-500 transition-[300ms]" href="{{ route('home') }}">Volver al home</a></li>
            @isset($menus)
                @auth
                    @foreach ($menus as $menuItem)
                        @if (!$menuItem->children->isEmpty())
                            @foreach ($menuItem->children as $item)
                                <li><a class="py-4 ps-2 border-s-4 border-color: transparent hover:border-s-indigo-500 transition-[300ms]" href="{{ route($item->url) }}">{{ $item->name }}</a></li>
                            @endforeach
                        @endif
                    @endforeach
                @endauth
            @endisset
        </ul>
    </div>
</div>