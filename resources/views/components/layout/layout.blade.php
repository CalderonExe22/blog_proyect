<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf" content="{{ csrf_token() }}">
    <title>{{ $titlePage ?? "default title" }}</title>
    <!-- Fontawesome -->
    <script src="https://kit.fontawesome.com/438901acfc.js" crossorigin="anonymous"></script>
    <!-- Fuente Montserrat -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    @vite('resources/css/app.css')
    @stack('scripts')
</head>
<body>
    <x-partials.header/>
        <main class="{{ $classMain ?? '' }}">
            {{ $slot }}
        </main>
    <x-partials.footer/>
</body>
</html>