const { validationResult } = require('express-validator');

const Story = require("../models/story");
const User = require("../models/user");
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

        if (stories.length === 0) {
            log.info("Danh sách tác phẩm hiện đang trống");
            return res.json({code: 0, message: "Danh sách tác phẩm hiện đang trống", result: stories});
        }

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

async function create(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    // Check whether fk_publisherAccount exists
    let user = await User.findOne({ _id: req.body.fk_publisherAccount }); // find one record by id
    if(!user) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
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

async function search(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let searchContent = req.query.searchContent;

    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 25; // 25 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let stories;

    try {
        let total = await Story.countDocuments({
            $or: [
              { storyName: { $regex: searchContent, $options: 'i' } },
              { authorName: { $regex: searchContent, $options: 'i' } },
              { ISBNcode: searchContent }
            ]
          }); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            stories = await Story.find({
                $or: [
                  { storyName: { $regex: searchContent, $options: 'i' } },
                  { authorName: { $regex: searchContent, $options: 'i' } },
                  { ISBNcode: searchContent }
                ]
              }).lean().skip(startIndex).limit(limit);
        else
            stories = await Story.find({
                $or: [
                  { storyName: { $regex: searchContent, $options: 'i' } },
                  { authorName: { $regex: searchContent, $options: 'i' } },
                  { ISBNcode: searchContent }
                ]
              }).lean().skip(startIndex);
        
        if (stories.length === 0) {
            log.info("Không tìm thấy tác phẩm nào phù hợp");
            return res.json({code: 0, message: "Không tìm thấy tác phẩm nào phù hợp", result: stories});
        }

        log.info("Tìm tác phẩm thành công");
        res.json({ code: 0, message: "Tìm tác phẩm thành công", result: stories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Tìm tác phẩm thất bại" });
    }
}

async function filter(req, res) {
    let {categoryId, selfComposedStory, publisherName, ratingPoint, isLastUpdated} = req.query;

    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = isLastUpdated ? 10 : 25; // if isLastUpdated true, get 10. Otherwise, get 25
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let stories;

    // create filter criterias
    let criterias = {};

    if (categoryId && categoryId !== "")
        criterias.categoriesAndTags = { $regex: categoryId, $options: 'i' };

    if (selfComposedStory && selfComposedStory !== "")
        criterias.selfComposedStory = selfComposedStory;
    
    if (publisherName && publisherName !== "")
        criterias.publisherName = publisherName;
    
    if (ratingPoint && ratingPoint !== "")
        criterias.ratingPoint = ratingPoint;

    // create sort criterias
    let sortCriterias = {}; 

    if (isLastUpdated && isLastUpdated === "true")
        sortCriterias.lastUpdate = -1; // sort by last update desc
    
    sortCriterias.viewCount = -1; // sort by view count desc

    try {
        let total = await Story.countDocuments(criterias); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            stories = await Story.find(criterias).sort(sortCriterias).lean().skip(startIndex).limit(limit);
        else
            stories = await Story.find(criterias).sort(sortCriterias).lean().skip(startIndex);
        
        if (stories.length === 0) {
            log.info("Không lọc được tác phẩm nào phù hợp");
            return res.json({code: 0, message: "Không lọc được tác phẩm nào phù hợp", result: stories});
        }

        log.info("Lọc tác phẩm thành công");
        res.json({ code: 0, message: "Lọc tác phẩm thành công", result: stories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Tìm tác phẩm thất bại" });
    }
}

module.exports = {
    getAll,
    getOne,
    create,
    search,
    filter
};