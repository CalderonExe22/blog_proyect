@foreach ($menus as $menu)
    @if (!$menu->children->isEmpty())
        <label class="cursoe-pointer" for="btn-menu"><i class="fa-solid fa-bars"></i></label>
        <input id="btn-menu" name="btn-menu" class="" type="checkbox">
        <div class="container-menu">
            <div class="cont-menu">
                <nav class="mt-28">
                    <span class="text-2xl p-5 text-center">Bienvenido: {{ Auth::user()->name }}</span>
                    <ul class="">

                        @foreach ($menu->children as $subMenuItem)
                            <li><a class="p-5" href="{{ route($subMenuItem->url) }}">{{ $subMenuItem->name }}</a>
                            </li>
                        @endforeach
                        <li><a class="p-5" href="{{ route('logout') }}">Logout</a></li>
                    </ul>
                </nav>
                <label for="btn-menu"><i class="fa-solid fa-x"></i></label>
            </div>
        </div>
    @else
        <li><a href="{{ route($menu->url) }}">{{ $menu->name }}</a></li>
    @endif
@endforeach