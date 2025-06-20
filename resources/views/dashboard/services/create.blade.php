<x-app-layout>
    <div class="container mx-auto" style="width: 70%;">
        <form action="{{ route('products.store') }}" method="POST" enctype="multipart/form-data" class="max-w-md mx-auto mt-8 space-y-6">
            @csrf

            <div>
                <label for="brand" class="block text-sm font-medium text-gray-700">Marca</label>
                <input type="text" name="brand" id="brand" value="{{ old('brand') }}" required
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                @error('brand')
                    <span class="text-red-500 text-xs">{{ $message }}</span>
                @enderror
            </div>

            <div>
                <label for="description" class="block text-sm font-medium text-gray-700">Descripción</label>
                <input type="text" name="description" id="description" value="{{ old('description') }}" required
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                @error('description')
                    <span class="text-red-500 text-xs">{{ $message }}</span>
                @enderror
            </div>

            <div>
                <label for="image" class="block text-sm font-medium text-gray-700">Imagen</label>
                <div class="relative mt-1 flex items-center">
                    <label for="image" class="cursor-pointer inline-block py-2 px-4 bg-blue-600 text-white font-semibold rounded-md shadow hover:bg-blue-700 transition-colors">
                        Seleccionar imagen
                        <input type="file" name="image" id="image" accept="image/*"
                            class="absolute inset-0 w-full h-full opacity-0 cursor-pointer"
                            onchange="previewImage(event)">
                    </label>
                </div>
                @error('image')
                    <span class="text-red-500 text-xs">{{ $message }}</span>
                @enderror
                <div class="mt-2">
                    <img id="image-preview" src="#" alt="Vista previa de la imagen" style="display: none; max-width: 100%; max-height: 200px;" />
                </div>
            </div>

            <div>
                <label for="width" class="block text-sm font-medium text-gray-700">Peso(KGs)</label>
                <input type="text" name="width" id="width" value="{{ old('width') }}"
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                @error('width')
                    <span class="text-red-500 text-xs">{{ $message }}</span>
                @enderror
            </div>

            <div>
                <label for="price" class="block text-sm font-medium text-gray-700">Precio por dia</label>
                <input type="text" name="price" id="price" value="{{ old('price') }}"
                    class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                @error('price')
                    <span class="text-red-500 text-xs">{{ $message }}</span>
                @enderror
            </div>

            <div>
                <button type="submit" class="w-full py-2 px-4 bg-blue-600 text-black rounded-md hover:bg-blue-700">Crear Producto</button>
            </div>
        </form>
    </div>
</x-app-layout>
