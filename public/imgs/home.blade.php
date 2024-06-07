<x-layouts.app title-app="Home">
    <section class="flex justify-center items-center w-lvh h-lvh text-white">
        <div class="flex items-start w-full">
            <div class="flex flex-col w-1/2 text-center gap-9 ms-12">
                <span class="text-8xl italic">Valle de la luna</span>
                <p class="text-2xl font-light">San juan</p>
                <p class="text-2xl font-light">El Parque Provincial de Ischigualasto, también llamado Valle de la Luna, se ubica en el noroeste de Argentina.</p>
                <span>Descubre mas</span>
            </div>
        </div>
        <img class="absolute top-0 object-cover w-full h-full -z-10 brightness-75" src="{{asset('imgs/Valle-de-la-Luna.webp')}}" alt="">
    </section>

    <section class="h-lvh">
        <div class="flex justify-center w-full h-full py-8 gap-48">
            <div class="flex w-[40%] flex-col justify-center text-center items-center font-thin gap-36">
                <span class="text-8xl">
                    Descubre lo lindo de Argentina.
                </span>
                <span class="text-3xl">Descubre mas</span>
            </div>               
            <div class="relative flex items-center w-[60%] h-full">
                <div class="absolute z-0 h-[800px] w-[500px] shadow-2xl">
                    <img class="object-cover w-full h-full" src="{{asset('imgs/ARCHI_8608661200x771.jpg')}}" alt="">
                </div>
                <div class="absolute left-1/3 -z-10 h-[700px] w-[400px]">
                    <img class="object-cover w-full h-full" src="{{asset('imgs/lago-moreno-patagonia-argentina.jpg')}}" alt="">
                </div>
                <div class="absolute left-2/3 -z-20 h-[600px] w-[250px]">
                    <img class="object-cover w-full h-full" src="{{asset('imgs/Perito_Moreno_Glacier_Patagonia_Argentina_Luca_Galuzzi_2005.jfif')}}" alt="">
                </div>
            </div>
        </div>
    </section>
    
    <section class="grid grid-cols-3 grid-rows-3 gap-8 h-full w-full px-28">
        <div class="h-full col-span-2">
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
        </div>
    </section>

    <section class="h-screen">
        <div class="grid grid-cols-3 h-full">
            <div class="grid col-span-3 text-center items-center">
                <span class="text-7xl font-thin">Categorias</span>
            </div>
            <div class="h-full">
                <img class="object-cover w-full h-full" src="{{asset('imgs/el-valle-de-la-luna-the.jpg')}}" alt="">
            </div>
            <div class="h-full">
                <img class="object-cover w-full h-full" src="{{asset('imgs/lago-moreno-patagonia-argentina.jpg')}}" alt="">
            </div>
            <div class="h-full">
                <img class="object-cover w-full h-full" src="{{asset('imgs/Perito_Moreno_Glacier_Patagonia_Argentina_Luca_Galuzzi_2005.jfif')}}" alt="">
            </div>
        </div>
    </section>    
</x-layouts.app>