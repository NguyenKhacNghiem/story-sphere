const { validationResult } = require('express-validator');

const Story = require("../models/story");
const log = require('../logs/log');

async function getAll(req, res) {
    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 25; // 25 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let stories;

    try {
        let total = await Story.countDocuments(); // Total records in database
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            stories = await Story.find().lean().skip(startIndex).limit(limit);
        else
            stories = await Story.find().lean().skip(startIndex);

        log.info("Lấy danh sách tác phẩm thành công");
        res.json({ code: 0, message: "Lấy danh sách tác phẩm thành công", result: stories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lấy danh sách tác phẩm thất bại" });
    }
}

function getOne(req, res) {
    Story.findOne({
        _id: req.params.id, // find one record by id
    })
    .then(result => {
        if(!result) {
            log.error("Tác phẩm không tồn tại");
            return res.json({code: 1, message: "Tác phẩm không tồn tại"});
        }

        log.info("Lấy thông tin tác phẩm thành công");
        res.json({code: 0, message: "Lấy thông tin tác phẩm thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Lấy thông tin tác phẩm thất bại"});
    });
}

function create(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let newStory = new Story({
        storyName: req.body.storyName,
        url: req.body.url,
        cover: req.body.cover,
        contentOutline: req.body.contentOutline,
        fk_publisherAccount: req.body.fk_publisherAccount,
        authorName: req.body.authorName,
        publisherName: req.body.publisherName,
        ISBNcode: req.body.ISBNcode,
        publishDate: req.body.publishDate,
        categoriesAndTags: req.body.categoriesAndTags,
        selfComposedStory: req.body.selfComposedStory,
        matureContent: req.body.matureContent,
        chapterCount: req.body.chapterCount,
        commercialActivated: req.body.commercialActivated,
        storySellPrice: req.body.storySellPrice,
    });
    
    newStory.save()
    .then(result => {        
        log.info("Tạo tác phẩm mới thành công");
        res.json({code: 0, message: "Tạo tác phẩm mới thành công", result: result});
    })
    .catch(error => {
        let errorMessage = error.message;
        log.error(errorMessage);

        // Check type of error
        if(errorMessage.includes("url"))
            res.json({code: 1, message: "URL cho tác phẩm đã tồn tại"});
        else if(errorMessage.includes("ISBNcode"))
            res.json({code: 1, message: "Mã vạch đã tồn tại"});
        else
            res.json({code: 1, message: "Tạo tác phẩm mới thất bại"});
    });
}

module.exports = {
    getAll,
    getOne,
    create,
};