
<label class="cursoe-pointer" for="btn-menu"><i class="fa-solid fa-bars"></i></label>
<input id="btn-menu" name="btn-menu" class="" type="checkbox">
    <div class="container-menu">
        <div class="cont-menu">
            <nav>
                <ul>
                    @dump($menu)
                    @foreach ($menu->children as $subMenuItem)
                        <li><a href="{{ route($subMenuItem->url) }}">{{ $subMenuItem->name }}</a></li>
                    @endforeach
                </ul>
            </nav>
            <label for="btn-menu"><i class="fa-solid fa-x"></i></label>
        </div>
    </div>