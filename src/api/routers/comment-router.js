const express = require('express');
const router = express.Router();

const commentController = require("../controllers/comment-controller");
const commentValidator = require("../validators/comment-validator");

router.get("/", commentValidator.getAllValidator, (req, res) => {
    commentController.getAll(req, res);
})

router.post("/create", commentValidator.createValidator, (req, res) => {
    commentController.create(req, res);
})

router.put("/edit/:id", commentValidator.editValidator, (req, res) => {
    commentController.edit(req, res);
})

router.delete("/delete/:id", (req, res) => {
    commentController.remove(req, res);
})

router.get("/:id", (req, res) => {
    commentController.getOne(req, res);
})

module.exports = router;