<header id="{{ $idHeader ?? '' }}" class="flex fixed justify-around w-full py-10">
    <nav>
        <h1>BlogWorld</h1>
    </nav>
    <nav>
        <ul class="flex gap-16">
            @auth
                <li><a href="{{ route('home') }}">Home</a></li>
                @foreach ($menus as $menu)
                    @if (!$menu->children->isEmpty())
                        <x-layouts.nav/>
                    @endif
                @endforeach
            @else
                <li></i>Soy no logeado</li>
                <li><a href="{{ route('home') }}">Home</a></li>
                <li><a href="{{ route('login') }}">Login</a></li>
            @endauth
        </ul>
    </nav>
</header>
    