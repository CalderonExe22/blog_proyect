<x-layouts.app class-main="flex" title-page="{{ $titlePage ?? '' }}">
        <x-layouts.sidebar name-user="{{ Auth::user()->name }}"/>
        <div class="w-full mt-28">
            {{ $slot }}
        </div>
</x-layouts.app>