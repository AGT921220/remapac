<x-app-layout>

    <div class="w-full min-h-screen py-12 bg-gray-50">


        <h2 class="text-2xl font-semibold mb-6 px-6">Servicios</h2>
        <div style="    margin: 0px 2rem;">

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            @foreach($services as $service)


<div class="bg-gradient-to-br from-blue-600 via-purple-600 to-pink-500 rounded-2xl shadow-xl p-1 transition-transform transform hover:scale-105 hover:shadow-2xl duration-300">
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

        @if(!empty($service->products))
            <div>
                <h4 class="text-lg font-semibold text-gray-700 mb-3">Productos rentados {{count($service->products)}}</h4>
                <ul class="space-y-4" style="overflow-y: auto;
    max-height: 378px;">
                    @foreach($service->products as $product)
                        <li class="border rounded-xl p-4 bg-gray-50 shadow-sm hover:shadow-md transition">
                            <div class="flex gap-4">
                                @if(!empty($product['image']))
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
</div>





                @endforeach
        </div>

        </div>
    </div>


</x-app-layout>
