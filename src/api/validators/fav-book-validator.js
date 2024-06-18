const { check } = require('express-validator');

module.exports = {
    getAllValidator: [
        check("userId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng cần lấy danh sách yêu thích"),
    ],

    createValidator: [
        check("userId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng cho danh sách yêu thích"),

        check("storyId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã tác phẩm cho danh sách yêu thích"),
    ],
};