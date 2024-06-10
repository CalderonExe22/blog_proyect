<header id="{{ $idHeader ?? '' }}" class="flex fixed justify-around w-full py-5 z-30 bg-white">
    <nav>
        <h1 class="text-3xl">BlogWorld</h1>
    </nav>
    <nav>
        <ul class="flex gap-16">
            @auth
                <li><a href="{{ route('home') }}">Home</a></li>
                @foreach ($menus as $menu)
                    @if (!$menu->children->isEmpty())
                        <x-layouts.nav/>
                    @else
                        <li><a href="{{ route($menu->url) }}">{{ $menu->name }}</a></li>
                        <li><a class="p-5" href="{{ route('logout') }}">Logout</a></li>
                    @endif
                @endforeach
            @else
                <li><a href="{{ route('home') }}">Home</a></li>
                <li><a href="{{ route('login') }}">Login</a></li>
            @endauth
        </ul>
    </nav>
</header>
    