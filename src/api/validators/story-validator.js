const { check } = require('express-validator');

module.exports = {
    createValidator: [
        check("storyName")
        .notEmpty()
        .withMessage("Vui lòng nhập tên tác phẩm"),

        check("url")
        .notEmpty()
        .withMessage("Vui lòng nhập URL cho tác phẩm")
        .isURL()
        .withMessage("Vui lòng nhập URL hợp lệ"),

        check("cover")
        .notEmpty()
        .withMessage("Vui lòng nhập ảnh bìa cho tác phẩm"),

        check("contentOutline")
        .notEmpty()
        .withMessage("Vui lòng nhập lời giới thiệu cho tác phẩm"),

        check("fk_publisherAccount")
        .notEmpty()
        .withMessage("Vui lòng nhập tài khoản đăng tải tác phẩm"),

        check("authorName")
        .notEmpty()
        .withMessage("Vui lòng nhập tên tác giả"),

        check("publisherName")
        .notEmpty()
        .withMessage("Vui lòng nhập tên nhà xuất bản"),

        check("ISBNcode")
        .notEmpty()
        .withMessage("Vui lòng nhập mã vạch")
        .isISBN()
        .withMessage("Vui lòng nhập mã vạch hợp lệ"),

        check("publishDate")
        .notEmpty()
        .withMessage("Vui lòng nhập ngày phát hành"),

        check("categoriesAndTags")
        .notEmpty()
        .withMessage("Vui lòng nhập các danh mục/ tags cho tác phẩm"),

        check("selfComposedStory")
        .notEmpty()
        .withMessage('Vui lòng chọn "Tác phẩm tự xuất bản?"'),

        check("matureContent")
        .notEmpty()
        .withMessage('Vui lòng chọn "Tác phẩm có chứa nội dung người lớn?"'),

        check("chapterCount")
        .notEmpty()
        .withMessage("Vui lòng nhập số lượng chương"),

        check("commercialActivated")
        .notEmpty()
        .withMessage('Vui lòng chọn "Tác phẩm có tính phí?"'),

        check("storySellPrice")
        .notEmpty()
        .withMessage("Vui lòng nhập giá mà người dùng phải trả cho tác phẩm"),
    ],

    searchValidator: [
        check("searchContent")
        .notEmpty()
        .withMessage("Vui lòng nhập nội dung tìm kiếm")
    ],
};