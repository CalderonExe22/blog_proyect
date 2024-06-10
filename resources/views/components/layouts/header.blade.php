<header id="{{ $idHeader ?? '' }}" class="flex fixed justify-around w-full py-5 z-30 bg-white">
    <nav>
        <h1 class="text-3xl">BlogWorld</h1>
    </nav>
    <nav>
        <ul class="flex gap-16">
            @auth
                <li><a class="border-transparent border-b-4 p-2 transition-all hover:border-indigo-500 hover:text-indigo-500" href=" {{ route('home')  }}">Home</a></li>
                @foreach ($menus as $menu)
                    @if (!$menu->children->isEmpty())
                        <x-layouts.nav/>
                    @else
                        <li><a class="border-transparent border-b-4 p-2 transition-all hover:border-indigo-500 hover:text-indigo-500" href="{{ route($menu->url) }}">{{ $menu->name }}</a></li>
                        <li><a class="border-transparent border-b-4 p-2 transition-all hover:border-indigo-500 hover:text-indigo-500" href="{{ route('logout') }}">Logout</a></li>
                    @endif
                @endforeach
            @else
                <li><a class="border-transparent border-b-4 p-2 transition-all hover:border-indigo-500 hover:text-indigo-500" href="{{ route('home') }}">Home</a></li>
                <li><a class="border-transparent border-b-4 p-2 transition-all hover:border-indigo-500 hover:text-indigo-500" href="{{ route('category.index') }}">Categorias</a></li>
                <li><a class="border-transparent border-b-4 p-2 transition-all hover:border-indigo-500 hover:text-indigo-500" href="{{ route('login') }}">Login</a></li>
            @endauth
        </ul>
    </nav>
</header>
    