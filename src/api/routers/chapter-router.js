const express = require('express');
const router = express.Router();

const chapterController = require("../controllers/chapter-controller");
const chapterValidator = require("../validators/chapter-validator");

router.get("/", chapterValidator.getAllValidator, (req, res) => {
    chapterController.getAll(req, res);
})

router.post("/create", chapterValidator.createValidator, (req, res) => {
    chapterController.create(req, res);
})

router.put("/publish", chapterValidator.publishValidator, (req, res) => {
    chapterController.publish(req, res);
})

router.get("/:id", (req, res) => {
    chapterController.getOne(req, res);
})

module.exports = router;