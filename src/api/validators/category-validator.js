const { check } = require('express-validator');

module.exports = {
    createAndEditValidator: [
        check("categoryName")
        .notEmpty()
        .withMessage("Vui lòng nhập tên danh mục"),
    ],
};