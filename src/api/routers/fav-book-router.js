const express = require('express');
const router = express.Router();

const favBookController = require("../controllers/fav-book-controller");
const favBookValidator = require("../validators/fav-book-validator");

router.get("/", (req, res) => {
    favBookController.getAll(req, res);
})

router.post("/create", favBookValidator.createValidator, (req, res) => {
    favBookController.create(req, res);
})

router.put("/edit/:id", (req, res) => {
    favBookController.edit(req, res);
})

router.delete("/delete/:id", (req, res) => {
    favBookController.remove(req, res);
})

// remove all favorite books
router.delete("/clear/:userId", (req, res) => {
    favBookController.clear(req, res);
})

module.exports = router;