<x-app-layout>

    <div class="w-full min-h-screen py-12 bg-gray-50">


        <h2 class="text-2xl font-semibold mb-6 px-6">Servicios</h2>
        <div style="    margin: 0px 2rem;">

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                @foreach ($services as $service)
                    {{-- <div class="bg-gradient-to-br from-blue-600 via-purple-600 to-pink-500 rounded-2xl shadow-xl p-1 transition-transform transform hover:scale-105 hover:shadow-2xl duration-300">
    <div class="bg-white rounded-2xl p-6 flex flex-col h-full space-y-4">
        <div class="flex justify-between items-start">
            <div>
                <h3 class="text-2xl font-bold text-gray-800">{{ $service->client_name }}</h3>
                <span class="inline-block mt-1 px-3 py-1 text-sm font-semibold text-white bg-yellow-500 rounded-full shadow">
                    {{ $service->status_text }}
                </span>
            </div>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7 text-yellow-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 5.636l-1.414 1.414M6.343 17.657l-1.414 1.414M4 12h2m12 0h2m-9 8V4m-4.95 4.95l1.414 1.414M15.536 15.536l1.414 1.414" />
            </svg>
        </div>

        @if (!empty($service->products))
            <div>
                <h4 class="text-lg font-semibold text-gray-700 mb-3">Productos rentados {{count($service->products)}}</h4>
                <ul class="space-y-4" style="overflow-y: auto;
    max-height: 378px;">
                    @foreach ($service->products as $product)
                        <li class="border rounded-xl p-4 bg-gray-50 shadow-sm hover:shadow-md transition">
                            <div class="flex gap-4">
                                @if (!empty($product['image']))
                                    <img src="{{ asset($product['image']) }}" alt="Imagen del producto" class="w-24 h-24 object-cover rounded-lg border">
                                @endif
                                <div class="flex-1">
                                    <div class="text-sm text-gray-800"><span class="font-bold">Descripción:</span> {{ $product['description'] }}</div>
                                    <div class="text-sm text-gray-700"><span class="font-bold">Marca:</span> {{ $product['brand'] }}</div>
                                    <div class="text-sm text-gray-700"><span class="font-bold">Precio:</span> ${{ $product['price'] }}</div>
                                    <div class="text-sm text-gray-700"><span class="font-bold">Cantidad:</span> {{ $product['quantity'] }}</div>
                                    <div class="text-sm text-gray-700"><span class="font-bold">Total:</span> ${{ $product['total_price'] }}</div>
                                    <div class="text-sm text-gray-600"><span class="font-bold">Números de serie:</span> {{ $product['serial_numbers'] }}</div>
                                </div>
                            </div>
                        </li>
                    @endforeach
                </ul>
            </div>
        @endif
    </div>
</div> --}}



                    <div class="p-4">
                        <div class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-1 gap-6">
                            <!-- START: Card de Servicio -->
                            <div
                                class="bg-white rounded-xl border border-gray-200 shadow-sm h-[540px] flex flex-col justify-between group">

                                <!-- Header del servicio -->
                                <div
                                    class="p-4 border-b border-gray-100 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
                                    <div>
                                        <h2 class="text-base font-semibold text-gray-900 leading-tight">
                                            {{ $service->client_name }}</h2>
                                        <span
                                            class="mt-1 inline-block px-2 py-0.5 text-xs font-medium text-gray-800 bg-yellow-100 rounded">
                                            {{ $service->status_text }}
                                        </span>
                                    </div>
                                    <div class="text-xs text-gray-600 space-y-0.5">
                                        <p><strong>Inicio:</strong> {{ $service->date_start }} </p>
                                        <p><strong>Fin:</strong> {{ $service->date_end }} </p>
                                        <p><strong>Total:</strong> ${{ $service->total_price }} </p>
                                    </div>
                                </div>

                                <!-- Productos -->
                                @if (!empty($service->products))
                                    <div class="p-4 flex-1 overflow-y-auto">
                                        <h4 class="text-xs font-semibold text-gray-500 uppercase mb-2">Productos</h4>
                                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-2">
                                            @foreach ($service->products as $product)
                                                <div
                                                    class="h-[260px] bg-gray-50 border border-gray-100 rounded-lg p-3 text-xs flex flex-col justify-between cursor-default">
                                                    @if (!empty($product['image']))
                                                        <img src="{{ asset($product['image']) }}"
                                                            alt="Imagen del producto"
                                                            class="w-full h-20 object-cover rounded border border-gray-200 mb-2">
                                                    @endif
                                                    <div class="flex-1 space-y-0.5 text-gray-700">
                                                        <p><strong>Desc:</strong> {{ $product['description'] }}</p>
                                                        <p><strong>Marca:</strong> {{ $product['brand'] }}</p>
                                                        <p><strong>Proyecto:</strong>
                                                            {{ $product['project_name'] ?? 'No asignado' }}</p>
                                                        <p><strong>Cant:</strong> {{ $product['quantity'] }}</p>
                                                        <p><strong>Serie(s):</strong> {{ $product['serial_numbers'] }}
                                                        </p>
                                                        <p><strong>Precio:</strong> ${{ $product['total_price'] }}</p>

                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endif



                                <!-- Botones del servicio -->
                                @if ($service->status === 'pending')
                                    <div class="flex justify-end gap-2 px-4 py-3 border-t border-gray-100 bg-gray-50">
                                        <button onclick="acceptService({{ $service->id }})"
                                            class="px-3 py-1.5 text-xs font-medium text-green-700 bg-green-100 rounded hover:bg-green-200 transition">
                                            Aceptar
                                        </button>
                                        <button onclick="declineService({{ $service->id }})"
                                            class="px-3 py-1.5 text-xs font-medium text-red-700 bg-red-100 rounded hover:bg-red-200 transition">
                                            Declinar
                                        </button>
                                    </div>
                                @endif




                            </div>
                            <!-- END: Card de Servicio -->
                        </div>
                    </div>
                @endforeach
            </div>

        </div>
    </div>



    <form id="actionForm" method="POST" action="{{ route('services.action') }}" style="display: none;">
        @csrf
        <input type="hidden" name="service_id" id="formServiceId">
        <input type="hidden" name="action" id="formAction">
        <input type="hidden" name="reason" id="formReason">
    </form>











</x-app-layout>
