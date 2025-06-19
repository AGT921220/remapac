<x-app-layout>
    <div class="container mx-auto" style="width: 70%;">
        <form action="{{ route('clients.store') }}" method="POST" class="max-w-md mx-auto mt-8 space-y-6">
            @csrf
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Nombre</label>
                <input type="text" name="name" id="name" required
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Correo Electrónico</label>
                <input type="email" name="email" id="email" required
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            </div>
            <div>
            {{-- <div>
            <label for="last_name" class="block text-sm font-medium text-gray-700">Apellido</label>
            <input type="text" name="last_name" id="last_name" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
        </div> --}}
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700">Contraseña</label>
                <input type="password" name="password" id="password" required
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            </div>
            <div>
                <label for="password_confirmation" class="block text-sm font-medium text-gray-700">Confirmar Contraseña</label>
                <input type="password" name="password_confirmation" id="password_confirmation" required
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            </div>
            <div>
                <button type="submit" class="w-full py-2 px-4 bg-blue-600 text-black rounded-md hover:bg-blue-700">Crear
                    Cliente</button>
            </div>
        </form>
    </div>
</x-app-layout>
