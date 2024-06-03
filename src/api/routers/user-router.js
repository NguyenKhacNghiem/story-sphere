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

router.put("/profile", userValidator.updateProfileValidator, (req, res) => {
    userController.updateProfile(req, res);
})

router.put("/profile/favGenreKeywords", userValidator.updateFavGenreKeywordsValidator, (req, res) => {
    userController.updateFavGenreKeywords(req, res);
})

router.get("/profile/:id", (req, res) => {
    userController.getProfile(req, res);
})

router.put("/change-password", userValidator.changePasswordValidator, (req, res) => {
    userController.changePassword(req, res);
})

module.exports = router;