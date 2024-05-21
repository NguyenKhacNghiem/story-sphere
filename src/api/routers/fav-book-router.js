const express = require('express');
const router = express.Router();

const favBookController = require("../controllers/fav-book-controller");
const favBookValidator = require("../validators/fav-book-validator");

router.get("/", favBookValidator.getAllValidator, (req, res) => {
    favBookController.getAll(req, res);
})

router.post("/create", favBookValidator.createValidator, (req, res) => {
    favBookController.create(req, res);
})

router.put("/edit/:id", favBookValidator.editValidator, (req, res) => {
    favBookController.edit(req, res);
})

router.delete("/delete/:id", (req, res) => {
    favBookController.remove(req, res);
})

module.exports = router;