<x-app-layout>

    <div class="w-full min-h-screen py-12 bg-gray-50">
        <div class="flex justify-end px-6 mb-4">
            <a href="{{ route('clients.create') }}"
                class="bg-green-600 text-gray-100 px-4 py-2 rounded hover:bg-green-700 transition shadow font-semibold">
                Crear cliente
            </a>
        </div>
        <h2 class="text-2xl font-semibold mb-6 px-6">Clientes</h2>
        <div class="overflow-x-auto px-6">
            <table id="clients-table" class="min-w-full bg-white border border-gray-200">
                <thead>
                    <tr>
                        <th class="px-4 py-2 border-b">ID</th>
                        <th class="px-4 py-2 border-b">Nombre</th>
                        <th class="px-4 py-2 border-b">Correo</th>
                        {{-- <th class="px-4 py-2 border-b">Teléfono</th> --}}
                        <th class="px-4 py-2 border-b">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($clients as $client)
                        <tr>
                            <td class="px-4 py-2 border-b text-center">{{ $client->id }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $client->name }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $client->email }}</td>
                            {{-- <td class="px-4 py-2 border-b">{{ $client->phone }}</td> --}}
                            <td class="px-4 py-2 border-b text-center">
                                <a href="{{ route('clients.show', $client) }}"
                                    class="text-blue-600 hover:underline">Ver</a>
                                <a href="{{ route('clients.edit', $client) }}"
                                    class="text-yellow-600 hover:underline ml-2">Editar</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    @push('scripts')
        <!-- DataTables CDN -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function() {
                $('#clients-table').DataTable({
                    language: {
                        url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
                    }
                });
            });
        </script>
    @endpush


</x-app-layout>
