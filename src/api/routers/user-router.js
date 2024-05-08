const express = require('express');
const router = express.Router();

const userController = require("../controllers/user-controller");
const userValidator = require("../validators/user-validator");

router.post("/register", userValidator.registerValidator, (req, res) => {
    userController.register(req, res);
})

router.post("/login", userValidator.loginValidator, (req, res) => {
    userController.login(req, res);
})

module.exports = router;