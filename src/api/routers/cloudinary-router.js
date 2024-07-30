const express = require('express');
const router = express.Router();

const fileUploader = require('../configs/cloudinary');
const cloudinaryController = require("../controllers/cloudinary-controller");

router.post('/upload-image', fileUploader.single('file'), (req, res) => {
    cloudinaryController.uploadImage(req, res);
});

module.exports = router;