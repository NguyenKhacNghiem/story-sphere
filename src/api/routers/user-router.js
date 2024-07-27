const express = require('express');
const router = express.Router();

const userController = require("../controllers/user-controller");
const userValidator = require("../validators/user-validator");

router.get("/", (req, res) => {
    userController.getAll(req, res);
})

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

router.put("/profile/email", userValidator.updateEmailValidator, (req, res) => {
    userController.updateEmail(req, res);
})

router.get("/profile/:id", (req, res) => {
    userController.getProfile(req, res);
})

router.put("/change-password", userValidator.changePasswordValidator, (req, res) => {
    userController.changePassword(req, res);
})

router.put("/forget-password", userValidator.forgetPasswordValidator, (req, res) => {
    userController.forgetPassword(req, res);
})

// Verify email when forget password or update new email
router.post("/verify-email", userValidator.verifyEmailValidator, (req, res) => {
    userController.verifyEmail(req, res);
})

router.get("/search", (req, res) => {
    userController.search(req, res);
})

router.get("/sort", (req, res) => {
    userController.sort(req, res);
})

router.put("/lock", userValidator.lockValidator, (req, res) => {
    userController.lock(req, res);
})

router.delete("/delete/:id", (req, res) => {
    userController.remove(req, res);
})

module.exports = router;