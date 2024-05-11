const fs = require('fs');

function getCurrentDateTime() {
    let currentDate = new Date();

    let day = currentDate.getDate();
    let month = currentDate.getMonth() + 1; 
    let year = currentDate.getFullYear();
    let hours = currentDate.getHours();
    let minutes = currentDate.getMinutes();
    let seconds = currentDate.getSeconds();

    let formattedDate = (day < 10 ? '0' : '') + day + '/' + (month < 10 ? '0' : '') + month + '/' + year;
    let formattedTime = (hours < 10 ? '0' : '') + hours + ':' + (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;

    return formattedDate + ' ' + formattedTime; // dd/mm/yyyy hh:mm:ss
}

function error(message) {
    let currentDateTime = getCurrentDateTime();
    message = "[ERROR] " + currentDateTime + " " + message;

    fs.appendFile(__dirname + '/log.txt', message + "\n", (error) => {
        if (error) 
            throw new Error(error.message);

        // console.log(message);
    });
}

function info(message) {
    let currentDateTime = getCurrentDateTime();
    message = "[INFO]  " + currentDateTime + " " + message;

    fs.appendFile(__dirname + '/log.txt', message + "\n", (error) => {
        if (error) 
            throw new Error(error.message);

        // console.log(message);
    });
}

module.exports = {
    error,
    info
};