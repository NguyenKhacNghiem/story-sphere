const express = require('express');
const router = express.Router();

const readingHistoryController = require("../controllers/reading-history-controller");
const readingHistoryValidator = require("../validators/reading-history-validator");

router.get("/", readingHistoryValidator.getAllValidator, (req, res) => {
    readingHistoryController.getAll(req, res);
})

router.post("/create-edit", readingHistoryValidator.createAndEditValidator, (req, res) => {
    readingHistoryController.createAndEdit(req, res);
})

router.delete("/delete/:id", (req, res) => {
    readingHistoryController.remove(req, res);
})

// remove all histories
router.delete("/clear/:userId", (req, res) => {
    readingHistoryController.clear(req, res);
})

module.exports = router;