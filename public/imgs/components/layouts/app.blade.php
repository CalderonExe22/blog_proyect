<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @vite('resources/css/app.css')
    <title>{{ $titleApp ?? "title default" }}</title>
</head>
<body class="flex flex-col gap-48">
    <x-partials.header/> 
    {{ $slot }}
    <x-partials.footer/>
</body>
</html>