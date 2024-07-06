const { check } = require('express-validator');

module.exports = {
    getAllValidator: [
        check("fk_storyId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã tác phẩm bạn muốn xem danh sách chương"),
    ],

    createValidator: [
        check("fk_storyId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã tác phẩm cho chương"),

        check("chapterName")
        .notEmpty()
        .withMessage("Vui lòng nhập tên chương"),

        check("chapterContent")
        .notEmpty()
        .withMessage("Vui lòng nhập nội dung chương"),

        check("chapterUrlKey")
        .notEmpty()
        .withMessage("Vui lòng nhập URL cho chương")
        .isURL()
        .withMessage("Vui lòng nhập URL hợp lệ"),

        check("chapterOrder")
        .notEmpty()
        .withMessage("Vui lòng nhập thứ tự chương"),

        check("matureContent")
        .notEmpty()
        .withMessage('Vui lòng chọn "Chương có chứa nội dung người lớn?"'),

        check("wordsCount")
        .notEmpty()
        .withMessage("Vui lòng nhập số từ cho chương"),

        check("commercialActivated")
        .notEmpty()
        .withMessage('Vui lòng chọn "Chương có tính phí?"'),

        check("chapterSellPrice")
        .notEmpty()
        .withMessage("Vui lòng nhập giá mà người dùng phải trả cho chương"),
    ],

    publishValidator: [
        check("_id")
        .notEmpty()
        .withMessage("Vui lòng nhập mã chương"),
    ],
};