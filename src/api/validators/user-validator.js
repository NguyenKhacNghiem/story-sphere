const { check } = require('express-validator');

module.exports = {
    registerValidator: [
        check("username")
        .notEmpty()
        .withMessage("Vui lòng nhập tài khoản"),

        check("password")
        .notEmpty()
        .withMessage("Vui lòng nhập mật khẩu"),

        check("confirmPassword")
        .custom((value, { req }) => {
            if (value !== req.body.password)
                throw new Error("Xác nhận mật khẩu không chính xác")

            return true;
        }),

        check("email")
        .notEmpty()
        .withMessage("Vui lòng nhập email")
        .isEmail()
        .withMessage("Email không đúng định dạng"),

        check("displayName")
        .notEmpty()
        .withMessage("Vui lòng nhập tên hiển thị"),

        check("dateOfBirth")
        .notEmpty()
        .withMessage("Vui lòng nhập ngày sinh"),
    ],

    loginValidator: [
        check("username")
        .notEmpty()
        .withMessage("Vui lòng nhập tài khoản"),

        check("password")
        .notEmpty()
        .withMessage("Vui lòng nhập mật khẩu"),
    ]
};