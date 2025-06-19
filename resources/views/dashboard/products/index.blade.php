<x-app-layout>

    <div class="w-full min-h-screen py-12 bg-gray-50">
        <div class="flex justify-end px-6 mb-4">
            <a href="{{ route('products.create') }}"
                class="bg-green-600 text-gray-100 px-4 py-2 rounded hover:bg-green-700 transition shadow font-semibold">
                Crear producte
            </a>
        </div>
        <h2 class="text-2xl font-semibold mb-6 px-6">productos</h2>
        <div class="overflow-x-auto px-6">
            <table id="products-table" class="min-w-full bg-white border border-gray-200">
                <thead>
                    <tr>
                        <th class="px-4 py-2 border-b">ID</th>
                        <th class="px-4 py-2 border-b">Marca</th>
                        <th class="px-4 py-2 border-b">Descripcion</th>
                        <th class="px-4 py-2 border-b">Imagen</th>
                        <th class="px-4 py-2 border-b">Series</th>
                        <th class="px-4 py-2 border-b">Peso(KGs)</th>
                        <th class="px-4 py-2 border-b">Precio por dia</th>
                        <th class="px-4 py-2 border-b">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($products as $product)
                        <tr>
                            <td class="px-4 py-2 border-b text-center">{{ $product->id }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $product->brand }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $product->description }}</td>
                            <td class="px-4 py-2 border-b text-center">
                                <img src="{{ asset($product->image) }}" alt="Imagen del producto"
                                    class="w-16 h-16 object-cover rounded">
                            </td>
                            <td class="px-4 py-2 border-b text-center">
                                <ul class="list-disc list-inside">
                                    @foreach ($product->serial_numbers as $serial)
                                        <li>{{ $serial }}</li>
                                    @endforeach
                                </ul>
                            </td>

                            <td class="px-4 py-2 border-b text-center">{{ $product->width }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $product->price }}</td>
                            {{-- <td class="px-4 py-2 border-b">{{ $product->phone }}</td> --}}
                            <td class="px-4 py-2 border-b text-center">
                                {{-- <a href="{{ route('products.show', $product) }}"
                                    class="text-blue-600 hover:underline">Ver</a>
                                <a href="{{ route('products.edit', $product) }}"
                                    class="text-yellow-600 hover:underline ml-2">Editar</a> --}}

                                <a onclick="openCreateSerialModal({{ $product->id }})"
                                    class="text-green-600 hover:underline ml-2 cursor-pointer">Crear Serie</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    @include('dashboard.modals.create_serial_modal')
    @push('scripts')
        <!-- DataTables CDN -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function() {
                $('#products-table').DataTable({
                    language: {
                        url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
                    }
                });
            });
        </script>
    @endpush


</x-app-layout>
