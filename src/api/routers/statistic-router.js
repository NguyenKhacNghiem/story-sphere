const express = require('express');
const router = express.Router();

const statisticController = require("../controllers/statistic-controller");

router.get("/quantity", (req, res) => {
    statisticController.quantity(req, res);
})

router.get("/quantity-by-category", (req, res) => {
    statisticController.quantityByCategory(req, res);
})

router.get("/top-10-user", (req, res) => {
    statisticController.top10User(req, res);
})

router.get("/top-10-story", (req, res) => {
    statisticController.top10Story(req, res);
})

module.exports = router;