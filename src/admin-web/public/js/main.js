toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": true,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "1000",
    "hideDuration": "500",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}

function formatDateTime(isoString) {
    let date = new Date(isoString);

    let day = String(date.getDate()).padStart(2, '0');
    let month = String(date.getMonth() + 1).padStart(2, '0');
    let year = date.getFullYear();

    // return date in dd/mm/yyyy format
    return `${day}/${month}/${year}`;
}

function getRandomColor() {
    let r, g, b;
    let isWhite = true;

    while (isWhite) {
        r = Math.floor(Math.random() * 256);
        g = Math.floor(Math.random() * 256);
        b = Math.floor(Math.random() * 256);

        isWhite = (r === 255 && g === 255 && b === 255);
    }

    return `rgb(${r}, ${g}, ${b})`;
}

function getRandomColorArray(n) {
    let arrayColor = [];

    for (let i = 0; i < n; i++)
        arrayColor.push(getRandomColor());
    
    return arrayColor;
}