@props([
    'posts' => []
])
<section class="grid grid-cols-3 grid-rows-3 gap-8 h-full w-full px-28">
    @foreach ($posts as $index => $post )
        @if ($index == 0)
            <div class="h-full col-span-2 postContainer">
                <div class="relative flex justify-center items-center w-full h-full">
                    <img class="imagePost object-cover w-full h-full transition-all" src="{{asset('storage/image2/'.$post->cover_image.'')}}" alt="">
                    <div class="information absolute flex flex-col gap-16 z-10 text-white text-center opacity-0 transition-all">
                        <H1 class="text-7xl font-medium">{{ $post->title }}</H1>
                        <a class="cursor-pointer p-2 transition-all hover:text-indigo-500" href="{{ route('show',$post->id) }}">Descubre mas</a>
                    </div>
                </div>
            </div>
        @elseif ($index == 5)
            <div class="h-full col-span-2 postContainer">
                <div class="relative flex justify-center items-center w-full h-full">
                    <img class="imagePost object-cover w-full h-full transition-all" src="{{asset('storage/image2/'.$post->cover_image.'')}}" alt="">
                    <div class="information absolute flex flex-col gap-16 z-10 text-white text-center opacity-0 transition-all">
                        <H1 class="text-7xl font-medium">{{ $post->title }}</H1>
                        <a class="cursor-pointer p-2 transition-all hover:text-indigo-500" href="{{ route('show',$post->id) }}">Descubre mas</a>
                    </div>
                </div>
            </div>
        @else
            <div class="h-full postContainer">
                <div class="relative flex justify-center items-center w-full h-full">
                    <img class="imagePost object-cover w-full h-full transition-all" src="{{asset('storage/image2/'.$post->cover_image.'')}}" alt="">
                    <div class="information absolute flex flex-col gap-16 z-10 text-white text-center opacity-0 transition-all">
                        <H1 class="text-7xl font-medium">{{ $post->title }}</H1>
                        <a class="cursor-pointer p-2 transition-all hover:text-indigo-500" href="{{ route('show',$post->id) }}">Descubre mas</a>
                    </div>
                </div>
            </div>
        @endif
    @endforeach
</section>