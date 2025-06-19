<x-app-layout>

    <div class="w-full min-h-screen py-12 bg-gray-50">
        <div class="flex justify-end px-6 mb-4">
            <button
                class="bg-green-600 text-gray-100 px-4 py-2 rounded hover:bg-green-700 transition shadow font-semibold"
                onclick="openCreateProjectModal({{ $clientId }})">
                Nuevo proyecto
            </button>
        </div>
        <h2 class="text-2xl font-semibold mb-6 px-6">Proyectos</h2>
        <div class="overflow-x-auto px-6">
            <table id="projects-table" class="min-w-full bg-white border border-gray-200">
                <thead>
                    <tr>
                        <th class="px-4 py-2 border-b">ID</th>
                        <th class="px-4 py-2 border-b">Nombre</th>
                        <th class="px-4 py-2 border-b">Ubicacion</th>
                        <th class="px-4 py-2 border-b">Responsable</th>
                        <th class="px-4 py-2 border-b">Teléfono</th>
                        <th class="px-4 py-2 border-b">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($projects as $project)
                        <tr>
                            <td class="px-4 py-2 border-b text-center">{{ $project->id }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $project->name }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $project->ubicacion }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $project->responsable }}</td>
                            <td class="px-4 py-2 border-b text-center">{{ $project->telefono }}</td>
                            {{-- <td class="px-4 py-2 border-b">{{ $project->phone }}</td> --}}
                            <td class="px-4 py-2 border-b text-center">
                                {{-- <a href="{{ route('projects.show', $project) }}"
                                    class="text-blue-600 hover:underline">Ver</a> --}}
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    @include('dashboard.modals.create_project_modal')
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
