const { validationResult } = require('express-validator');

const ReviewStory = require("../models/review-story");
const User = require("../models/user");
const Story = require("../models/story");
const log = require('../logs/log');
const utils = require('../utils'); 

async function getAll(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let storyId = req.body.storyId;

    let story = await Story.findOne({ _id: storyId }); // find one record by id
    if(!story) {
        log.error("Tác phẩm không tồn tại");
        return res.json({code: 1, message: "Tác phẩm không tồn tại"});
    }

    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 5; // 5 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let reviewStories;

    try {
        let total = await ReviewStory.countDocuments({ storyId: storyId }); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            reviewStories = await ReviewStory.find({ storyId: storyId }).lean().skip(startIndex).limit(limit);
        else
            reviewStories = await ReviewStory.find({ storyId: storyId }).lean().skip(startIndex);
        
        if (reviewStories.length === 0) {
            log.info("Danh sách đánh giá hiện đang trống");
            return res.json({code: 0, message: "Danh sách đánh giá hiện đang trống", result: reviewStories});
        }

        log.info("Lấy danh sách đánh giá thành công");
        res.json({ code: 0, message: "Lấy danh sách đánh giá thành công", result: reviewStories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lấy danh sách đánh giá thất bại" });
    }
}

async function filterByStoryId(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let {storyId, ratePoint} = req.body;

    let story = await Story.findOne({ _id: storyId }); // find one record by id
    if(!story) {
        log.error("Tác phẩm không tồn tại");
        return res.json({code: 1, message: "Tác phẩm không tồn tại"});
    }

    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 5; // 5 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let reviewStories;

    try {
        let total = await ReviewStory.countDocuments({ storyId: storyId, ratePoint: ratePoint }); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            reviewStories = await ReviewStory.find({ storyId: storyId, ratePoint: ratePoint }).lean().skip(startIndex).limit(limit);
        else
            reviewStories = await ReviewStory.find({ storyId: storyId, ratePoint: ratePoint }).lean().skip(startIndex);
        
        if (reviewStories.length === 0) {
            log.info("Không lọc được đánh giá nào phù hợp");
            return res.json({code: 0, message: "Không lọc được đánh giá nào phù hợp", result: reviewStories});
        }

        log.info("Lọc danh sách đánh giá thành công");
        res.json({ code: 0, message: "Lọc danh sách đánh giá thành công", result: reviewStories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lọc danh sách đánh giá thất bại" });
    }
}

function getOne(req, res) {
    ReviewStory.findOne({
        _id: req.params.id, // find one record by id
    })
    .then(result => {
        if(!result) {
            log.error("Đánh giá không tồn tại");
            return res.json({code: 1, message: "Đánh giá không tồn tại"});
        }

        log.info("Lấy thông tin đánh giá thành công");
        res.json({code: 0, message: "Lấy thông tin đánh giá thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Lấy thông tin đánh giá thất bại"});
    });
}

async function create(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let {userId, storyId, ratePoint, reviewContent, replyTo} = req.body;

    // Check whether userId exists
    let user = await User.findOne({ _id: userId }); // find one record by id
    if(!user) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    // Check whether storyId exists
    let story = await Story.findOne({ _id: storyId }); // find one record by id
    if(!story) {
        log.error("Tác phẩm không tồn tại");
        return res.json({code: 1, message: "Tác phẩm không tồn tại"});
    }

    // Check whether replyTo exists
    if (replyTo !== undefined) {
        let reviewStory = await ReviewStory.findOne({ _id: replyTo }); // find one record by id

        if(!reviewStory) {
            log.error("Đánh giá bạn muốn trả lời không tồn tại");
            return res.json({code: 1, message: "Đánh giá bạn muốn trả lời không tồn tại"});
        }
    }

    let newReviewStory = new ReviewStory({
        userId: userId,
        storyId: storyId,
        ratePoint: ratePoint,
        reviewContent: reviewContent,
        replyTo: replyTo
    });
    
    newReviewStory.save()
    .then(result => {        
        log.info("Thêm đánh giá thành công");
        res.json({code: 0, message: "Thêm đánh giá thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Thêm đánh giá thất bại"});
    });
}

async function edit(req, res) {
    try {
        // Input validation
        let result = validationResult(req);
        if(result.errors.length > 0) {
            log.error(result.errors[0].msg);
            return res.json({code: 1, message: result.errors[0].msg});
        }

        let _id = req.params.id;
        let reviewStory = await ReviewStory.findOne({ _id: _id }); // find one record by id

        if(!reviewStory) {
            log.error("Đánh giá không tồn tại");
            return res.json({code: 1, message: "Đánh giá không tồn tại"});
        }

        // Change fields of record
        reviewStory.reviewContent = req.body.reviewContent; 
        reviewStory.reviewTime = utils.getCurrentDateTime();

        // Change the ratePoint if it is not a reply review
        if (reviewStory.replyTo === -1)
            reviewStory.ratePoint = req.body.ratePoint ? req.body.ratePoint : reviewStory.ratePoint;

        await reviewStory.save();

        log.info("Chỉnh sửa đánh giá thành công");
        res.json({code: 0, message: "Chỉnh sửa đánh giá thành công"});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Chỉnh sửa đánh giá thất bại"});
    }
}

async function remove(req, res) {
    let _id = req.params.id;
    let deletedReviewStory = await ReviewStory.findOneAndDelete({ _id: _id }); // find one record and delete its if exists

    if(!deletedReviewStory) {
        log.error("Đánh giá không tồn tại");
        return res.json({code: 1, message: "Đánh giá không tồn tại"});
    }

    log.info("Xóa đánh giá thành công");
    res.json({code: 0, message: "Xóa đánh giá thành công"});
}

module.exports = {
    getAll,
    filterByStoryId,
    getOne,
    create,
    edit,
    remove
};