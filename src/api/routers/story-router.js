const express = require('express');
const router = express.Router();

const storyController = require("../controllers/story-controller");
const storyValidator = require("../validators/story-validator");

router.get("/", (req, res) => {
    storyController.getAll(req, res);
})

router.post("/create", storyValidator.createValidator, (req, res) => {
    storyController.create(req, res);
})

router.get("/search", storyValidator.searchValidator, (req, res) => {
    storyController.search(req, res);
})

router.get("/filter", (req, res) => {
    storyController.filter(req, res);
})

router.get("/:id", (req, res) => {
    storyController.getOne(req, res);
})

module.exports = router;