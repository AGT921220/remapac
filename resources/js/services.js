window.acceptService = function(id) {
    if (confirm('¿Estás seguro de aceptar este servicio?')) {
        document.getElementById('formServiceId').value = id;
        document.getElementById('formAction').value = 'accept';
        document.getElementById('formReason').value = '';
        document.getElementById('actionForm').submit();
    }
}

window.declineService = function(id) {
    const reason = prompt('¿Por qué estás declinando este servicio?');
    if (reason !== null && reason.trim() !== '') {
        document.getElementById('formServiceId').value = id;
        document.getElementById('formAction').value = 'decline';
        document.getElementById('formReason').value = reason.trim();
        document.getElementById('actionForm').submit();
    } else {
        alert('Debes ingresar una razón para declinar.');
    }
}
