const { check } = require('express-validator');

module.exports = {
    getAllValidator: [
        check("chapterId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã chương cần lấy danh sách bình luận"),
    ],

    createValidator: [
        check("userId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng cho bình luận"),

        check("chapterId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã chương cho bình luận"),

        check("comtContent")
        .notEmpty()
        .withMessage("Vui lòng nhập nội dung cho bình luận"),
    ],

    editValidator: [
        check("comtContent")
        .notEmpty()
        .withMessage("Vui lòng nhập nội dung cho bình luận"),
    ],
};