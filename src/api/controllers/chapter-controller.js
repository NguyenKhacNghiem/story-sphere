const { validationResult } = require('express-validator');

const Chapter = require("../models/chapter");
const Story = require("../models/story");
const log = require('../logs/log');

async function getAll(req, res) {
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let fk_storyId = req.body.fk_storyId;

    let story = await Story.findOne({ _id: fk_storyId });
    if(!story) {
        log.error("Tác phẩm không tồn tại");
        return res.json({code: 1, message: "Tác phẩm không tồn tại"});
    }

    let chapters = await Chapter.find({ fk_storyId: fk_storyId }).lean();
    if (chapters.length === 0) {
        log.info("Tác phẩm này hiện chương có chương nào");
        return res.json({code: 0, message: "Tác phẩm này hiện chương có chương nào", result: chapters});
    }

    log.info("Lấy danh sách chương trong một tác phẩm thành công");
    res.json({code: 0, message: "Lấy danh sách chương trong một tác phẩm thành công", result: chapters});
}

function getOne(req, res) {
    Chapter.findOne({
        _id: req.params.id,
    })
    .then(result => {
        if(!result) {
            log.error("Chương không tồn tại");
            return res.json({code: 1, message: "Chương không tồn tại"});
        }

        log.info("Lấy thông tin chương thành công");
        res.json({code: 0, message: "Lấy thông tin chương thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Lấy thông tin chương thất bại"});
    });
}

function create(req, res) {
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let newChapter = new Chapter({
        fk_storyId: req.body.fk_storyId,
        chapterName: req.body.chapterName,
        chapterUrlKey: req.body.chapterUrlKey,
        chapterOrder: req.body.chapterOrder,
        chapterStatus: req.body.chapterStatus,
        matureContent: req.body.matureContent,
        wordsCount: req.body.wordsCount,
        commercialActivated: req.body.commercialActivated,
        chapterSellPrice: req.body.chapterSellPrice
    });
    
    newChapter.save()
    .then(result => {        
        log.info("Tạo chương mới thành công");
        res.json({code: 0, message: "Tạo chương mới thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Tạo chương mới thất bại"});
    });
}

async function publish(req, res) {
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let _id = req.body._id;
    let chapter = await Chapter.findOne({ _id: _id });

    if(!chapter) {
        log.error("Chương không tồn tại");
        return res.json({code: 1, message: "Chương không tồn tại"});
    }

    chapter.chapterStatus = 2; // 2 is public

    await chapter.save();

    log.info("Đăng tải chương thành công");
    res.json({code: 0, message: "Đăng tải chương thành công"});
}

module.exports = {
    getAll,
    getOne,
    create,
    publish
};