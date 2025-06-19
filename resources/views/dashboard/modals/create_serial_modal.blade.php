<div class="modal fade" id="createSerialModal" tabindex="-1" aria-labelledby="createSerialModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ route('inventory.store') }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="createSerialModalLabel">Crear Serie para el producto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <input type="hidden" name="product_id" class="product_id">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="serial_number" class="form-label">Serie</label>
                        <input type="text" class="form-control" id="serial_number" name="serial_number" required>
                    </div>

                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Crear</button>
                </div>
            </form>
        </div>
    </div>
</div>
