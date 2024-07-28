const Category = require("../models/category");
const Chapter = require("../models/chapter");
const Comment = require("../models/comment");
const ReviewStory = require("../models/review-story");
const Story = require("../models/story");
const User = require("../models/user");
const log = require('../logs/log');

async function quantity(req, res) {
    try {
        let countStory = await Story.countDocuments();
        let countChapter = await Chapter.countDocuments();
        let countCategory = await Category.countDocuments();
        let countUser = await User.countDocuments();
        let countComment = await Comment.countDocuments();
        let countReview = await ReviewStory.countDocuments();

        let result = [countStory, countChapter, countCategory, countUser, countComment, countReview];

        log.info("Thống kê số lượng thành công");
        res.json({ code: 0, message: "Thống kê số lượng thành công", result: result });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Thống kê số lượng thất bại" });
    }
}

async function quantityByCategory(req, res) {
    try {
        let result = new Map();
        let categories = await Category.find().lean();
        let stories = await Story.find().lean();
        let count;

        categories.forEach(c => {
            count = 0;

            stories.forEach(s => {
                if (s.categoriesAndTags.includes(c._id.toString()))
                    count++;       
            })

            result.set(c.categoryName.toString(), count);
        })

        log.info("Thống kê số lượng tác phẩm theo danh mục thành công");
        res.json({ code: 0, message: "Thống kê số lượng tác phẩm theo danh mục thành công", result: Object.fromEntries(result) });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Thống kê số lượng tác phẩm theo danh mục thất bại" });
    }
}

async function top10User(req, res) {
    try {
        let result = new Map();
        let users = await User.find().lean();
        let stories = await Story.find().lean();
        let count;

        users.forEach(u => {
            count = 0;

            stories.forEach(s => {
                if (s.fk_publisherAccount === u._id)
                    count++;       
            })

            result.set(u.username.toString(), count);
        })

        // Get top 10 user
        let sortedEntries = Array.from(result.entries())
            .sort((a, b) => b[1] - a[1]);

        let top10Entries = sortedEntries.slice(0, 10);

        let top10Map = new Map(top10Entries);

        log.info("Thống kê 10 người dùng đăng tải nhiều tác phẩm nhất thành công");
        res.json({ code: 0, message: "Thống kê 10 người dùng đăng tải nhiều tác phẩm nhất thành công", result: Object.fromEntries(top10Map) });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Thống kê 10 người dùng đăng tải nhiều tác phẩm nhất thất bại" });
    }
}

async function top10Story(req, res) {
    try {
        let result = new Map();
        let stories = await Story.find().lean();

        stories.forEach(s => result.set(s.storyName, s.viewCount));

        let sortedEntries = Array.from(result.entries())
            .sort((a, b) => b[1] - a[1]);

        let top10Entries = sortedEntries.slice(0, 10);
        let top10Map = new Map(top10Entries);

        log.info("Thống kê 10 tác phẩm có lượt xem cao nhất thành công");
        res.json({ code: 0, message: "Thống kê 10 tác phẩm có lượt xem cao nhất thành công", result: Object.fromEntries(top10Map) });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Thống kê 10 tác phẩm có lượt xem cao nhất thất bại" });
    }
}

module.exports = {
    quantity,
    quantityByCategory,
    top10User,
    top10Story
};