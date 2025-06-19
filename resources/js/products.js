window.previewImage = function (event) {
    const input = event.target;
    const preview = document.getElementById("image-preview");
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            preview.src = e.target.result;
            preview.style.display = "block";
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        preview.src = "#";
        preview.style.display = "none";
    }
}

window.openCreateSerialModal = function (productId) {
   const modalEl = document.getElementById('createSerialModal');
        const modal = new bootstrap.Modal(modalEl);
        modalEl.querySelectorAll('.product_id').forEach(el => {
            el.value = productId;
        });
        modal.show();
}


