// Import packages
const express = require('express')
const mongoose = require("mongoose");
require("dotenv").config();

// Import routers
const userRouter = require('./routers/user-router');
const storyRouter = require('./routers/story-router');
const chapterRouter = require('./routers/chapter-router');
const categoryRouter = require('./routers/category-router');

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
app.use('/story', storyRouter);
app.use('/chapter', chapterRouter);
app.use('/category', categoryRouter);

// Import log writer module
const log = require('./logs/log');

// Middle ware 404 error
app.use((req, res) => {
    res.status(404);
    log.error("Page not found!");
})

// Middle ware 500 error
app.use((err, req, res, next) => {
    res.status(500);
    log.error(err.message);
})

// Connect to database
mongoose.connect(CONNECTION_STRING, { 
    useNewUrlParser: true, 
    useUnifiedTopology: true 
})
.then(async () => {
    log.info("Database has been connected");
    app.listen(PORT); // Server run on port 3000
})
.catch((error) => {
    log.error(error.message);
});