function getCurrentDateTime() {
    let today = new Date();
    let day = String(today.getDate()).padStart(2, '0');
    let month = String(today.getMonth() + 1).padStart(2, '0'); 
    let year = today.getFullYear();
    let hours = String(today.getHours()).padStart(2, '0');
    let minutes = String(today.getMinutes()).padStart(2, '0');
    let seconds = String(today.getSeconds()).padStart(2, '0');

    // return current date time in dd/MM/yyyy HH:mm:ss format
    return `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;
}

function getCurrentDate() {
    let today = new Date();
    let day = String(today.getDate()).padStart(2, '0');
    let month = String(today.getMonth() + 1).padStart(2, '0'); 
    let year = today.getFullYear();

    // return current date in dd/MM/yyyy format
    return `${day}/${month}/${year}`;
}

module.exports = {
    getCurrentDateTime,
    getCurrentDate
};