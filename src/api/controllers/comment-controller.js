const { validationResult } = require('express-validator');

const Comment = require("../models/comment");
const User = require("../models/user");
const Chapter = require("../models/chapter");
const log = require('../logs/log');
const utils = require('../utils'); 

async function getAll(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let chapterId = req.body.chapterId;

    let chapter = await Chapter.findOne({ _id: chapterId }); // find one record by id
    if(!chapter) {
        log.error("Chương không tồn tại");
        return res.json({code: 1, message: "Chương không tồn tại"});
    }

    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 25; // 25 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let comments;

    try {
        let total = await Comment.countDocuments({ chapterId: chapterId }); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            comments = await Comment.find({ chapterId: chapterId }).lean().skip(startIndex).limit(limit);
        else
            comments = await Comment.find({ chapterId: chapterId }).lean().skip(startIndex);
        
        if (comments.length === 0) {
            log.info("Danh sách bình luận hiện đang trống");
            return res.json({code: 0, message: "Danh sách bình luận hiện đang trống", result: comments});
        }

        log.info("Lấy danh sách bình luận thành công");
        res.json({ code: 0, message: "Lấy danh sách bình luận thành công", result: comments, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lấy danh sách bình luận thất bại" });
    }
}

function getOne(req, res) {
    Comment.findOne({
        _id: req.params.id, // find one record by id
    })
    .then(result => {
        if(!result) {
            log.error("Bình luận không tồn tại");
            return res.json({code: 1, message: "Bình luận không tồn tại"});
        }

        log.info("Lấy thông tin bình luận thành công");
        res.json({code: 0, message: "Lấy thông tin bình luận thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Lấy thông tin bình luận thất bại"});
    });
}

async function create(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let {userId, chapterId, atParagraph, comtContent, replyTo} = req.body;

    // Check whether userId exists
    let user = await User.findOne({ _id: userId }); // find one record by id
    if(!user) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    // Check whether chapterId exists
    let chapter = await Chapter.findOne({ _id: chapterId }); // find one record by id
    if(!chapter) {
        log.error("Chương không tồn tại");
        return res.json({code: 1, message: "Chương không tồn tại"});
    }

    // Check whether replyTo exists
    if (replyTo !== undefined) {
        let comment = await Comment.findOne({ _id: replyTo }); // find one record by id

        if(!comment) {
            log.error("Bình luận bạn muốn trả lời không tồn tại");
            return res.json({code: 1, message: "Bình luận bạn muốn trả lời không tồn tại"});
        }
    }
    
    let newComment = new Comment({
        userId: userId,
        chapterId: chapterId,
        atParagraph: atParagraph,
        comtContent: comtContent,
        replyTo: replyTo
    });
    
    newComment.save()
    .then(result => {        
        log.info("Thêm bình luận thành công");
        res.json({code: 0, message: "Thêm bình luận thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Thêm bình luận thất bại"});
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
        let comment = await Comment.findOne({ _id: _id }); // find one record by id

        if(!comment) {
            log.error("Bình luận không tồn tại");
            return res.json({code: 1, message: "Bình luận không tồn tại"});
        }

        // Change fields of record
        comment.comtContent = req.body.comtContent; 
        comment.comtTime = utils.getCurrentDateTime();

        await comment.save();

        log.info("Chỉnh sửa bình luận thành công");
        res.json({code: 0, message: "Chỉnh sửa bình luận thành công"});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Chỉnh sửa bình luận thất bại"});
    }
}

async function remove(req, res) {
    let _id = req.params.id;
    let deletedComment = await Comment.findOneAndDelete({ _id: _id }); // find one record and delete its if exists

    if(!deletedComment) {
        log.error("Bình luận không tồn tại");
        return res.json({code: 1, message: "Bình luận không tồn tại"});
    }

    log.info("Xóa bình luận thành công");
    res.json({code: 0, message: "Xóa bình luận thành công"});
}

module.exports = {
    getAll,
    getOne,
    create,
    edit,
    remove
};