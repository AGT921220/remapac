<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="font-sans antialiased">
    <div class="min-h-screen bg-gray-100 dark:bg-gray-900">
        @include('layouts.navigation')

        <!-- Page Heading -->
        @isset($header)
            <header class="bg-white dark:bg-gray-800 shadow">
                <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                    {{ $header }}
                </div>
            </header>
        @endisset

            @if (session('success'))
                <div
                x-data="{ show: true }"
                x-init="setTimeout(() => show = false, 3000)"
                x-show="show"
                x-transition
                class="fixed top-6 right-6 z-50 max-w-sm w-full"
                >
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded shadow-lg flex items-start">
                <span class="flex-1">{{ session('success') }}</span>
                <button @click="show = false" class="ml-4 text-green-700 hover:text-green-900">
                &times;
                </button>
                </div>
                </div>
                <script src="//unpkg.com/alpinejs" defer></script>
            @endif

            @if ($errors->any())
                <div
                x-data="{ show: true }"
                x-init="setTimeout(() => show = false, 5000)"
                x-show="show"
                x-transition
                class="fixed top-20 right-6 z-50 max-w-sm w-full"
                >
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded shadow-lg flex flex-col gap-2">
                <div class="flex items-start">
                    <span class="flex-1 font-semibold">Se encontraron errores:</span>
                    <button @click="show = false" class="ml-4 text-red-700 hover:text-red-900">
                    &times;
                    </button>
                </div>
                <ul class="list-disc list-inside text-sm">
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
                </div>
                </div>
                <script src="//unpkg.com/alpinejs" defer></script>
            @endif



        <!-- Page Content -->
        <main>
            {{ $slot }}
        </main>
    </div>
</body>

</html>
