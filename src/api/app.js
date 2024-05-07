// Import packages
const express = require('express')
const mongoose = require("mongoose");
require("dotenv").config();

// Import routers
const userRouter = require('./routers/user-router');

// Get data from .env file
const PORT = process.env.PORT;
const CONNECTION_STRING = process.env.CONNECTION_STRING;

// Config projects
const app = express()
app.use(express.static(__dirname + '/public')) // access folder public to use img, ...
app.use(express.json());  // get data from request in JSON format
app.use(express.urlencoded({ extended: true })); // get data from request in URL-ENCODED format 

// Use routers
app.use('/user', userRouter);

// Middle ware 404 error
app.use((req, res) => {
    res.status(404) 
    throw new Error('[Error] Page not found!');
})

// Middle ware 500 error
app.use((err, req, res, next) => {
    res.status(500);
    throw new Error('[Error] ' + err.message);
})

// Connect to database
mongoose.connect(CONNECTION_STRING, { 
    useNewUrlParser: true, 
    useUnifiedTopology: true 
})
.then(async () => {
    console.log('[INFO] Database has been connected');
    app.listen(PORT); // Server run on port 3000
})
.catch((error) => {
    throw new Error('[ERROR]'+ error.message)
});



