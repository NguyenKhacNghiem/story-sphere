const { check } = require('express-validator');

module.exports = {
    getAllValidator: [
        check("userId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng cần lấy lịch sử đọc"),
    ],

    createAndEditValidator: [
        check("userId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng cho lịch sử đọc"),

        check("storyId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã tác phẩm cho lịch sử đọc"),
    ],
};