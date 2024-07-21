const express = require('express');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const hbs = require('express-handlebars');
const fetch = require('node-fetch');

const app = express();

app.use(cookieParser('storysphere'))
app.use(session({
    secret: "storysphere",
    resave: true,
    saveUninitialized: true
}))

app.engine('handlebars', hbs.engine({
    defaultLayout: 'main',
}));
app.set('view engine', 'handlebars');

app.use(express.json());   
app.use(express.urlencoded({ extended: true }));

app.use(express.static(__dirname + '/public'))

app.get("/", (req, res) => {
    if(!req.session.username)
        res.redirect("/login")
    else
        res.redirect("/story")
})

app.get("/login", (req, res) => {
    if(req.session.username)
        res.redirect("/story");
    else 
        res.render("login", {layout: null});
})

app.post("/login", (req, res) => {
    fetch("http://localhost:3000/user/login", {
        method: "POST",
        body: new URLSearchParams({
            username: req.body.username,
            password: req.body.password
        })
    })
    .then(response => response.json())
    .then(json => {
        if(json.code === 100)
            req.session.username = "nknghiem"; // login success

        res.json({code: json.code, message: json.message})
    })
})

app.get("/logout", (req, res) => {
    delete req.session.username;
    res.render("login", {layout: null});
})

app.get("/story", (req, res) => {
    // if(!req.session.username)
    //     res.redirect("/login");
    // else
        res.render("story");
})

app.get("/category", (req, res) => {
    // if(!req.session.username)
    //     res.redirect("/login");
    // else
        res.render("category");
})

// Xử lý lỗi 404 và 500
app.use((req, res) => {
    res.status(404) 
    res.render('404', {layout: null})
})

app.use((err, req, res, next) => {
    res.status(500);
    res.render('500', {layout: null});
});

app.listen(8080, () => {
    console.log("Open website for admin: http://localhost:8080");
})