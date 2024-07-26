const express = require('express');
const router = express.Router();

const storyController = require("../controllers/story-controller");
const storyValidator = require("../validators/story-validator");

router.get("/", (req, res) => {
    storyController.getAll(req, res);
})

router.get("/favorite-category", storyValidator.getStoryByFavCatValidator, (req, res) => {
    storyController.getStoryByFavCat(req, res);
})

router.get("/most-view", (req, res) => {
    storyController.getMostViewStories(req, res);
})

router.post("/create", storyValidator.createValidator, (req, res) => {
    storyController.create(req, res);
})

router.get("/search", (req, res) => {
    storyController.search(req, res);
})

router.get("/filter", (req, res) => {
    storyController.filter(req, res);
})

router.get("/sort", (req, res) => {
    storyController.sort(req, res);
})

router.put("/publish", storyValidator.publishValidator, (req, res) => {
    storyController.publish(req, res);
})

router.delete("/delete/:id", (req, res) => {
    storyController.remove(req, res);
})

router.get("/:id", (req, res) => {
    storyController.getOne(req, res);
})

module.exports = router;