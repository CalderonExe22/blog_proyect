@props([
    'posts' => []
])
<section class="grid grid-cols-3 grid-rows-3 gap-8 h-full w-full px-28">
    <!--<div class="h-full col-span-2">
        <img class="object-cover w-full h-full" src="{{asset('imgs/el-valle-de-la-luna-the.jpg')}}" alt="">
    </div>
    <div class="flex justify-center h-full w-full text-center items-center">
        <span class="text-7xl font-extralight">
            Un tesoro como ningun otro.
        </span>
    </div>
    <div class="h-full">
        <img class="object-cover w-full h-full" src="{{asset('imgs/lago-moreno-patagonia-argentina.jpg')}}" alt="">
    </div>
    <div class="h-full">
        <img class="object-cover w-full h-full" src="{{asset('imgs/lago-moreno-patagonia-argentina.jpg')}}" alt="">
    </div>
    <div class="h-full">
        <img class="object-cover w-full h-full" src="{{asset('imgs/el-valle-de-la-luna-the.jpg')}}" alt="">
    </div>
    <div class="flex justify-center h-full w-full text-center items-center">
        <span class="text-7xl font-extralight">
            Un tesoro como ningun otro.
        </span>
    </div>
    <div class="h-full col-span-2">
        <img class="object-cover w-full h-full" src="{{asset('imgs/lago-moreno-patagonia-argentina.jpg')}}" alt="">
    </div>-->
    @foreach ($posts as $index => $post )
        @if ($index == 0)
            <div class="h-full col-span-2 postContainer">
                <div class="relative flex justify-center items-center w-full h-full">
                    <img class="imagePost object-cover w-full h-full transition-all" src="{{asset('storage/image2/'.$post->cover_image.'')}}" alt="">
                    <div class="information absolute flex flex-col gap-16 z-10 text-white text-center opacity-0 transition-all">
                        <H1 class="text-7xl font-medium">{{ $post->title }}</H1>
                        <a href="{{ route('show',$post->id) }}">Descubre mas</a>
                    </div>
                </div>
            </div>
        @elseif ($index == 5)
            <div class="h-full col-span-2 postContainer">
                <div class="relative flex justify-center items-center w-full h-full">
                    <img class="imagePost object-cover w-full h-full transition-all" src="{{asset('storage/image2/'.$post->cover_image.'')}}" alt="">
                    <div class="information absolute flex flex-col gap-16 z-10 text-white text-center opacity-0 transition-all">
                        <H1 class="text-7xl font-medium">{{ $post->title }}</H1>
                        <a href="{{ route('show',$post->id) }}">Descubre mas</a>
                    </div>
                </div>
            </div>
        @else
            <div class="h-full postContainer">
                <div class="relative flex justify-center items-center w-full h-full">
                    <img class="imagePost object-cover w-full h-full transition-all" src="{{asset('storage/image2/'.$post->cover_image.'')}}" alt="">
                    <div class="information absolute flex flex-col gap-16 z-10 text-white text-center opacity-0 transition-all">
                        <H1 class="text-7xl font-medium">{{ $post->title }}</H1>
                        <a href="{{ route('show',$post->id) }}">Descubre mas</a>
                    </div>
                </div>
            </div>
        @endif
    @endforeach
</section>