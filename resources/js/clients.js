window.openCreateProjectModal = function (clientId) {
   const modalEl = document.getElementById('createProjectModal');
        const modal = new bootstrap.Modal(modalEl);
        modalEl.querySelectorAll('.client_id').forEach(el => {
            el.value = clientId;
        });
        modal.show();
}
