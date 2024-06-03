<header class="flex fixed justify-around w-full py-10">
    <nav>
        <h1>BlogWorld</h1>
    </nav>
    <nav>
        <ul class="flex gap-16">
            @auth
                @foreach ($menus as $menu)
                    <li><a href="{{ route($menu->url) }}">{{ $menu->name }}</a></li>
                    @if ($menu->children->isNotEmpty)
                        <ul>
                            @foreach ($menu->children as $subMenuItem)
                                <li><a href="{{ route($subMenuItem->url) }}">{{ $subMenuItem->name }}</a></li>
                            @endforeach
                        </ul>
                    @endif
                @endforeach
            @else
                <li><a href="{{ route('home') }}">Home</a></li>
                <li><a href="{{ route('login') }}">Login</a></li>
                <li><a href="{{ route('categories') }}">categorias</a></li>
            @endauth
        </ul>
    </nav>
</header>