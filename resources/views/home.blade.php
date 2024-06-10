<x-layouts.app title-page="Home" class-main="flex flex-col justify-center items-center w-full h-full m-0 gap-48">

    <x-slot:header></x-slot:header>

    @foreach ($postRandom as $post)
        <section class="flex justify-center items-center w-full h-screen text-white">
            <div class="flex items-start w-full">
                <div class="flex flex-col w-1/2 text-center gap-9 ms-12">
                    <span class="text-8xl italic">{{ $post->title }}</span>
                    <p class="text-2xl font-light">{{ $post->location }}</p>
                    <p class="text-2xl font-light">{{ $post->description }}</p>
                    <a class="cursor-pointer p-2 transition-all hover:text-indigo-500" href="{{ route('show',$post->id) }}">Descubre mas</a>
                </div>
            </div>
            <img class="absolute top-0 object-cover w-full h-full -z-10 brightness-75"
                src="{{ asset('storage/image2/' . $post->cover_image . '') }}" alt="{{ $post->title }}">
        </section>
    @endforeach

    <section class="h-lvh">
        <div class="grid grid-cols-2 justify-center w-full h-full py-8 gap-28">
            <div class="flex flex-col justify-center text-center items-center font-thin gap-36">
                <h1 class="text-8xl">
                    Descubre lo lindo de Argentina.
                </h1>
                <a href="{{ route('category.index') }}" class="text-2xl font-normal p-2 transition-all hover:text-indigo-500">Descubre mas</a>
            </div>
            <div class="flex items-center h-full">
                <div class="relative h-full  z-0">
                    <img class="object-cover w-full h-full" src="{{ asset('imgs/ARCHI_8608661200x771.jpg') }}"
                        alt="">
                </div>
                <div class="relative h-[800px] right-16  -z-10">
                    <img class="object-cover w-full h-full"
                        src="{{ asset('imgs/lago-moreno-patagonia-argentina.jpg') }}" alt="">
                </div>
                <div class="relative right-32  h-[650px] -z-20">
                    <img class="object-cover w-full h-full"
                        src="{{ asset('imgs/Perito_Moreno_Glacier_Patagonia_Argentina_Luca_Galuzzi_2005.jfif') }}"
                        alt="">
                </div>
            </div>
        </div>
    </section>

    <x-homePost :posts="$posts" />

    <x-carruselCategory :categories="$categories" />

</x-layouts.app>
