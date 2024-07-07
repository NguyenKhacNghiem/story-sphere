const { check } = require('express-validator');

module.exports = {
    createAndEditValidator: [
        check("categoryUrl")
        .notEmpty()
        .withMessage("Vui lòng nhập URL cho danh mục"),
        // .isURL()
        // .withMessage("Vui lòng nhập URL hợp lệ"),

        check("categoryName")
        .notEmpty()
        .withMessage("Vui lòng nhập tên danh mục"),
    ],
};