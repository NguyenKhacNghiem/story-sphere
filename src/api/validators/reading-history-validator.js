const { check } = require('express-validator');

module.exports = {
    createAndEditValidator: [
        check("userId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng cho lịch sử đọc"),

        check("storyId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã tác phẩm cho lịch sử đọc"),
    ],
};