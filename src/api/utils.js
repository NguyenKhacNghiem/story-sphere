const nodemailer = require("nodemailer");
require("dotenv").config();

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

async function sendEmail(receiver, otp) {
    let transport = nodemailer.createTransport({
        host: process.env.HOST,
        service: process.env.SERVICE,
        auth: {
            user: process.env.SENDER,
            pass: process.env.APP_PASSWORD,
        }
    })

    let title = "[STORY SPHERE] XÁC THỰC EMAIL";
    let content = `<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Email Verification</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
            .email-wrapper {
                width: 100%;
                background: url('https://c.wallhere.com/photos/71/79/Nordic_landscape_mountains_trees_wood_forest_deer_Sun-1844683.jpg!d') no-repeat center center;
                background-size: cover;
                padding: 40px 0;
            }
            .email-container {
                background-color: rgba(255, 255, 255, 0.9);
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            }
            .header {
                text-align: center;
                padding: 20px 0;
            }
            .header img {
                width: 100px;
                margin-bottom: 10px;
            }
            .content {
                text-align: center;
                padding: 20px 40px;
            }
            .content h1 {
                color: #333333;
                margin-bottom: 20px;
                font-size: 24px;
            }
            .text {
                color: #666666;
                line-height: 1.6;
                margin-bottom: 20px;
                font-size: 16px;
            }
            .otp-code {
                display: inline-block;
                font-size: 28px;
                color: #0073e6;
                margin: 20px 0;
                font-weight: bold;
                padding: 10px 20px;
                border: 2px dashed #0073e6;
                border-radius: 5px;
                background-color: #f0f8ff;
            }
            .footer {
                text-align: center;
                padding: 20px;
                color: #999999;
                font-size: 12px;
                background-color: #f9f9f9;
                border-top: 1px solid #eeeeee;
            }
        </style>
    </head>
    <body>
        <div class="email-wrapper">
            <div class="email-container">
                <div class="header">
                    <img src="/img/logo.png" alt="Story Sphere">
                    <h2>Story Sphere</h2>
                </div>
                <div class="content">
                    <div class="text">Bạn vui lòng nhập mã xác thực bên dưới để hoàn tất yêu cầu nhé!</div>
                    <div class="otp-code">${otp}</div>
                    <div class="text">Đây là email tự động. Vui lòng không phản hồi email này.</div>
                </div>
                <div class="footer">
                    &copy; 2024 Story Sphere. All rights reserved.
                </div>
            </div>
        </div>
    </body>
    </html>
    `

    let options = {
        from: process.env.APP_NAME,
        to: receiver,
        subject: title,
        html: content
    }
    
    return await transport.sendMail(options);
}

module.exports = {
    getCurrentDateTime,
    getCurrentDate,
    sendEmail,
};