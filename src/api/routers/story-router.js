const express = require('express');
const router = express.Router();

const storyController = require("../controllers/story-controller");
const storyValidator = require("../validators/story-validator");

router.get("/", (req, res) => {
    storyController.getAll(req, res);
})

router.get("/:id", (req, res) => {
    storyController.getOne(req, res);
})

router.post("/create", storyValidator.createValidator, (req, res) => {
    storyController.create(req, res);
})

module.exports = router;