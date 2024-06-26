
<x-layouts.app 
title-page="Login" 
class-main="flex justify-center items-center h-screen">
<x-slot:header></x-slot:header>

    <form class="flex flex-col gap-12 p-16 bg-indigo-300" action="{{ route('login') }}" method="POST">
        @csrf
        <h1 class="text-center text-5xl font-thin">Login</h1>
        @error('noRegister')
            <span class="text-red-700 font-semibold">No esta registrado en el sistema</span>
        @enderror
        <div>
            <label for="email">Email:</label><br>
            <input id="email" value="{{ old('email')}}" name="email" type="email" required><br>
            @error('email')
                <span class="text-red-600">{{ $message }}</span>
            @enderror
        </div>
        <div>
            <label for="password">Password:</label><br>
            <input id="password" value="{{ old('password') }}" name="password" type="password" required><br>
            @error('password')
                <span class="text-red-600">{{ $message }}</span>
            @enderror
        </div>
        <input type="submit" value="Login" class="cursor-pointer">
    </form>

</x-layouts.app>