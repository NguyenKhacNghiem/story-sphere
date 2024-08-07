const express = require('express');
const router = express.Router();

const categoryController = require("../controllers/category-controller");
const categoryValidator = require("../validators/category-validator");

router.get("/", (req, res) => {
    categoryController.getAll(req, res);
})

router.get("/no-paging", (req, res) => {
    categoryController.getAllWithoutPaging(req, res);
})

router.post("/create", categoryValidator.createAndEditValidator, (req, res) => {
    categoryController.create(req, res);
})

router.get("/search", (req, res) => {
    categoryController.search(req, res);
})

router.get("/sort", (req, res) => {
    categoryController.sort(req, res);
})

router.put("/edit/:id", categoryValidator.createAndEditValidator, (req, res) => {
    categoryController.edit(req, res);
})

router.delete("/delete/:id", (req, res) => {
    categoryController.remove(req, res);
})

router.get("/:id", (req, res) => {
    categoryController.getOne(req, res);
})

module.exports = router;