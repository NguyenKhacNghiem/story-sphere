const { check } = require('express-validator');

module.exports = {
    registerValidator: [
        check("username")
        .notEmpty()
        .withMessage("Vui lòng nhập tài khoản"),

        check("password")
        .notEmpty()
        .withMessage("Vui lòng nhập mật khẩu")
        .isLength({ min: 8 })
        .withMessage('Mật khẩu phải chứa ít nhất 8 ký tự'),

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
    ],

    loginValidator: [
        check("username")
        .notEmpty()
        .withMessage("Vui lòng nhập tên đăng nhập hoặc email"),

        check("password")
        .notEmpty()
        .withMessage("Vui lòng nhập mật khẩu"),
    ],

    // TODO: Update email with verify email
    updateEmailValidator: [
        check("_id")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng"),

        check("email")
        .notEmpty()
        .withMessage("Vui lòng nhập email")
        .isEmail()
        .withMessage("Email không đúng định dạng"),
    ],

    updateProfileValidator: [
        check("_id")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng"),

        check("displayName")
        .notEmpty()
        .withMessage("Vui lòng nhập tên hiển thị"),

        check("dateOfBirth")
        .notEmpty()
        .withMessage("Vui lòng nhập ngày sinh")
        .matches(/^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/)
        .withMessage('Ngày sinh không đúng định dạng (dd/MM/yyyy)'),
    ],

    updateFavGenreKeywordsValidator: [
        check("_id")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng"),
    ],

    changePasswordValidator: [
        check("_id")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng"),

        check("oldPassword")
        .notEmpty()
        .withMessage("Vui lòng nhập mật khẩu cũ"),

        check("password")
        .notEmpty()
        .withMessage("Vui lòng nhập mật khẩu mới")
        .isLength({ min: 8 })
        .withMessage('Mật khẩu mới phải chứa ít nhất 8 ký tự'),

        check("confirmPassword")
        .custom((value, { req }) => {
            if (value !== req.body.password)
                throw new Error("Xác nhận mật khẩu mới không chính xác")

            return true;
        }),
    ]
};