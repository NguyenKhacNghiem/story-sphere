const { validationResult } = require('express-validator');

const FavBook = require("../models/fav-book");
const User = require("../models/user");
const Story = require("../models/story");
const Chapter = require('../models/chapter');
const log = require('../logs/log');

async function getAll(req, res) {
    let userId = req.query.userId || -1;

    let user = await User.findOne({ _id: userId }); // find one record by id
    if(!user) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 5; // 5 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let favbooks;

    try {
        let total = await FavBook.countDocuments({ userId: userId }); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            favbooks = await FavBook.find({ userId: userId }).lean().skip(startIndex).limit(limit);
        else
            favbooks = await FavBook.find({ userId: userId }).lean().skip(startIndex);

        // Sort favorite list by addedDate desc
        favbooks.sort((a, b) => {
            let [aDate, aTime] = a.addedDate.split(' ');
            let [aDay, aMonth, aYear] = aDate.split('/');
            let [bDate, bTime] = b.addedDate.split(' ');
            let [bDay, bMonth, bYear] = bDate.split('/');
            
            let aFormatted = `${aYear}${aMonth}${aDay}${aTime}`;
            let bFormatted = `${bYear}${bMonth}${bDay}${bTime}`;
            
            return bFormatted.localeCompare(aFormatted); // compare by addedDate desc
        })
        
        if (favbooks.length === 0) {
            log.info("Danh sách tác phẩm yêu thích hiện đang trống");
            return res.json({code: 0, message: "Danh sách tác phẩm yêu thích hiện đang trống", result: favbooks});
        }

        log.info("Lấy danh sách tác phẩm yêu thích thành công");
        res.json({ code: 0, message: "Lấy danh sách tác phẩm yêu thích thành công", result: favbooks, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lấy danh sách tác phẩm yêu thích thất bại" });
    }
}

async function create(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let {userId, storyId, readingProgressChapter} = req.body;

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

    // Check whether readingProgressChapter exists
    if(readingProgressChapter) {
        let chapter = await Chapter.findOne({ _id: readingProgressChapter }); // find one record by id
        if(!chapter) {
            log.error("Chương không tồn tại");
            return res.json({code: 1, message: "Chương không tồn tại"});
        }
    }

    let newFavBook = new FavBook({
        userId: userId,
        storyId: storyId,
        readingProgressChapter: readingProgressChapter
    });
    
    newFavBook.save()
    .then(result => {        
        log.info("Thêm tác phẩm vào danh sách yêu thích thành công");
        res.json({code: 0, message: "Thêm tác phẩm vào danh sách yêu thích thành công", result: result});
    })
    .catch(error => {
        let errorMessage = error.message;
        log.error(errorMessage);

        // Check type of error
        if(errorMessage.includes("userId_1_storyId_1"))
            res.json({code: 1, message: "Tác phẩm này đã tồn tại trong danh sách yêu thích"});
        else
            res.json({code: 1, message: "Thêm tác phẩm vào danh sách yêu thích thất bại"});
    });
}

async function edit(req, res) {
    try {
        let _id = req.params.id;
        let favBook = await FavBook.findOne({ _id: _id }); // find one record by id

        if(!favBook) {
            log.error("Tác phẩm trong danh sách yêu thích không tồn tại");
            return res.json({code: 1, message: "Tác phẩm trong danh sách yêu thích không tồn tại"});
        }

        // Check whether readingProgressChapter exists
        let readingProgressChapter = req.body.readingProgressChapter;
        
        if (readingProgressChapter) {
            let chapter = await Chapter.findOne({ _id: readingProgressChapter }); // find one record by id
            if(!chapter) {
                log.error("Chương không tồn tại");
                return res.json({code: 1, message: "Chương không tồn tại"});
            }
        }

        // Change fields of record
        favBook.readingProgressChapter = req.body.readingProgressChapter ? req.body.readingProgressChapter : -1; 

        await favBook.save();

        log.info("Chỉnh sửa tác phẩm trong danh sách yêu thích thành công");
        res.json({code: 0, message: "Chỉnh sửa tác phẩm trong danh sách yêu thích thành công"});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Chỉnh sửa tác phẩm trong danh sách yêu thích thất bại"});
    }
}

async function remove(req, res) {
    let _id = req.params.id;
    let deletedFavBook = await FavBook.findOneAndDelete({ _id: _id }); // find one record and delete its if exists

    if(!deletedFavBook) {
        log.error("Tác phẩm trong danh sách yêu thích không tồn tại");
        return res.json({code: 1, message: "Tác phẩm trong danh sách yêu thích không tồn tại"});
    }

    log.info("Xóa tác phẩm trong danh sách yêu thích thành công");
    res.json({code: 0, message: "Xóa tác phẩm trong danh sách yêu thích thành công"});
}

// remove all favorite books
async function clear(req, res) {
    let userId = req.params.userId;

    let user = await User.findOne({ _id: userId }); // find one record by id
    if(!user) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    let result = await FavBook.deleteMany({userId: userId});
    if (result.deletedCount === 0) {
        log.error("Danh sách tác phẩm yêu thích hiện đang trống");
        return res.json({ code: 0, message: "Danh sách tác phẩm yêu thích hiện đang trống" });
    }

    log.info("Xóa tất cả tác phẩm trong danh sách yêu thích thành công");
    res.json({ code: 0, message: "Xóa tất cả tác phẩm trong danh sách yêu thích thành công" });
}

module.exports = {
    getAll,
    create,
    edit,
    remove,
    clear
};