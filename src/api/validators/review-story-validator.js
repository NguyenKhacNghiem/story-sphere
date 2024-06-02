const { check } = require('express-validator');

module.exports = {
    getAllValidator: [
        check("storyId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã tác phẩm cần lấy danh sách đánh giá"),
    ],

    filterByStoryId: [
        check("storyId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã tác phẩm cho đánh giá"),

        check("ratePoint")
        .notEmpty()
        .withMessage("Vui lòng nhập số sao đánh giá"),
    ],

    createValidator: [
        check("userId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã người dùng cho đánh giá"),

        check("storyId")
        .notEmpty()
        .withMessage("Vui lòng nhập mã tác phẩm cho đánh giá"),

        check("reviewContent")
        .notEmpty()
        .withMessage("Vui lòng nhập nội dung cho đánh giá"),

        check("ratePoint")
        .custom((value, { req }) => {
            if (!value && !req.body.replyTo)
                throw new Error("Vui lòng chỉ định đánh giá này là đánh giá chấm điểm hay là trả lời đánh giá khác")

            return true;
        }),
    ],

    editValidator: [
        check("reviewContent")
        .notEmpty()
        .withMessage("Vui lòng nhập nội dung cho đánh giá"),
    ],
};