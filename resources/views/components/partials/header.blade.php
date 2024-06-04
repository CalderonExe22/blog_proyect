<header class="flex fixed justify-around w-full py-10">
    <nav>
        <h1>BlogWorld</h1>
    </nav>
    <nav>
        <ul class="flex gap-16">
            @auth
                <li><a href="{{ route('home') }}">Home</a></li>
                @foreach ($menus as $menu)
                    @if (!$menu->children->isEmpty())
                        <label class="cursoe-pointer" for="btn-menu"><i class="fa-solid fa-bars"></i></label>
                        <input id="btn-menu" name="btn-menu" class="" type="checkbox">
                        <div class="container-menu">
                            <div class="cont-menu">
                                <nav>
                                    <ul>
                                        <li>{{ Auth::user()->name }}</li>
                                        @foreach ($menu->children as $subMenuItem)
                                            <li><a href="{{ route($subMenuItem->url) }}">{{ $subMenuItem->name }}</a></li>
                                        @endforeach
                                    </ul>
                                </nav>
                                <label for="btn-menu"><i class="fa-solid fa-x"></i></label>
                            </div>
                        </div>
                    @else
                    <li><a href="{{ route($menu->url) }}">{{ $menu->name }}</a></li>
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
    