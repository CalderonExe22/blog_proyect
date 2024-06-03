<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $titlePage ?? "default title" }}</title>
    @vite('resources/css/app.css')
</head>
<body>
    <x-partials.header/>
        <main class="{{ $classMain ?? '' }}">
            {{ $slot }}
        </main>
    <x-partials.footer/>
</body>
</html>