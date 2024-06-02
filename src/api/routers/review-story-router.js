const express = require('express');
const router = express.Router();

const reviewStoryController = require("../controllers/review-story-controller");
const reviewStoryValidator = require("../validators/review-story-validator");

router.get("/", reviewStoryValidator.getAllValidator, (req, res) => {
    reviewStoryController.getAll(req, res);
})

router.get("/filter", reviewStoryValidator.filterByStoryId, (req, res) => {
    reviewStoryController.filterByStoryId(req, res);
})

router.post("/create", reviewStoryValidator.createValidator, (req, res) => {
    reviewStoryController.create(req, res);
})

router.put("/edit/:id", reviewStoryValidator.editValidator, (req, res) => {
    reviewStoryController.edit(req, res);
})

router.delete("/delete/:id", (req, res) => {
    reviewStoryController.remove(req, res);
})

router.get("/:id", (req, res) => {
    reviewStoryController.getOne(req, res);
})

module.exports = router;