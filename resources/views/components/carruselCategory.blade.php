@push('scripts')
    @vite(['resources/js/carrusel.js'])
@endpush
<section class="flex flex-col h-screen">
    <div class="carousel-title flex justify-center my-32">
        <span class="text-7xl font-thin">Categorias</span>
    </div>
    <div class="relative carrusel-container h-full overflow-hidden">
        <div class="carousel flex h-full">
            @foreach ($categories as $category)
                <div class="carousel-item relative flex justify-center items-center h-full w-full">
                    <img class="object-cover h-full w-full transition-all imagenCategory" src="{{asset('imgs/el-valle-de-la-luna-the.jpg')}}" alt="">
                    <div class="informationCategory absolute flex flex-col gap-16 z-20 text-white text-center transition opacity-0">
                        <h1 class="text-5xl font-medium">{{ $category->name }}</h1>
                        <form action="{{ route('category.filter') }}" method="get">
                            <input type="hidden" name="categories[]" value="{{ $category->id }}">
                            <input type="submit" value="Descubre mas" class="cursor-pointer">
                        </form>
                    </div>
                </div>
            @endforeach
            
           <!-- <div class="carousel-item">
                <img class="object-cover h-full w-full" src="{{asset('imgs/lago-moreno-patagonia-argentina.jpg')}}" alt="">
            </div>
            <div class="carousel-item">
                <img class="object-cover h-full w-full" src="{{asset('imgs/Perito_Moreno_Glacier_Patagonia_Argentina_Luca_Galuzzi_2005.jfif')}}" alt="">
            </div>
            <div class="carousel-item">
                <img class="object-cover h-full w-full" src="{{asset('imgs/el-valle-de-la-luna-the.jpg')}}" alt="">
            </div>
            <div class="carousel-item">
                <img class="object-cover h-full w-full" src="{{asset('imgs/lago-moreno-patagonia-argentina.jpg')}}" alt="">
            </div>
            <div class="carousel-item">
                <img class="object-cover h-full w-full" src="{{asset('imgs/Perito_Moreno_Glacier_Patagonia_Argentina_Luca_Galuzzi_2005.jfif')}}" alt="">
            </div> -->
        </div>
        <div class="controls absolute inset-y-1/2 w-full flex justify-between px-4 z-20">
            <button id="prev" class="bg-gray-700 text-white rounded-full text-5xl"><i class="fa-solid fa-chevron-left"></i></button>
            <button id="next" class="bg-gray-700 text-white rounded-full text-5xl"><i class="fa-solid fa-chevron-right"></i></button>
        </div>
    </div>
</section>
