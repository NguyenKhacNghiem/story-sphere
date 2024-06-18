const { validationResult } = require('express-validator');

const ReadingHistory = require("../models/reading-history");
const User = require("../models/user");
const Story = require("../models/story");
const log = require('../logs/log');
const utils = require("../utils");
const Chapter = require('../models/chapter');

async function getAll(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let userId = req.body.userId;

    let user = await User.findOne({ _id: userId }); // find one record by id
    if(!user) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 25; // 25 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let histories;

    try {
        let total = await ReadingHistory.countDocuments({ userId: userId }); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total) {
            histories = await ReadingHistory.find({ userId: userId }).lean().skip(startIndex).limit(limit);
            
            histories.sort((a, b) => {
                let [aDate, aTime] = a.lastVisited.split(' ');
                let [aDay, aMonth, aYear] = aDate.split('/');
                let [bDate, bTime] = b.lastVisited.split(' ');
                let [bDay, bMonth, bYear] = bDate.split('/');
                
                let aFormatted = `${aYear}${aMonth}${aDay}${aTime}`;
                let bFormatted = `${bYear}${bMonth}${bDay}${bTime}`;
                
                return bFormatted.localeCompare(aFormatted); // compare by lastVisited desc
            })
        }      
        else {
            histories = await ReadingHistory.find({ userId: userId }).lean().skip(startIndex);
            
            histories.sort((a, b) => {
                let [aDate, aTime] = a.lastVisited.split(' ');
                let [aDay, aMonth, aYear] = aDate.split('/');
                let [bDate, bTime] = b.lastVisited.split(' ');
                let [bDay, bMonth, bYear] = bDate.split('/');
                
                let aFormatted = `${aYear}${aMonth}${aDay}${aTime}`;
                let bFormatted = `${bYear}${bMonth}${bDay}${bTime}`;
                
                return bFormatted.localeCompare(aFormatted); // compare by lastVisited desc
            });
        }
            
        
        if (histories.length === 0) {
            log.info("Danh sách lịch sử xem hiện đang trống");
            return res.json({code: 0, message: "Danh sách lịch sử xem hiện đang trống", result: histories});
        }

        log.info("Lấy danh sách lịch sử xem thành công");
        res.json({ code: 0, message: "Lấy danh sách lịch sử xem thành công", result: histories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lấy danh sách lịch sử xem thất bại" });
    }
}

async function createAndEdit(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let {userId, storyId, chapterId} = req.body;

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

    // Check whether chapterId exists
    if(chapterId) {
        let chapter = await Chapter.findOne({ _id: chapterId }); // find one record by id
        if(!chapter) {
            log.error("Chương không tồn tại");
            return res.json({code: 1, message: "Chương không tồn tại"});
        }
    }

    let history = await ReadingHistory.findOne({userId: userId, storyId: storyId});
    // History does not exist -> add
    if(!history) {
        let newReadingHistory = new ReadingHistory({
            userId: userId,
            storyId: storyId,
            chapterId: chapterId
        });
        
        newReadingHistory.save()
        .then(result => {        
            log.info("Thêm lịch sử xem thành công");
            res.json({code: 0, message: "Thêm lịch sử xem thành công", result: result});
        })
        .catch(error => {
            log.error(error.message);
            res.json({code: 1, message: "Thêm lịch sử xem thất bại"});
        });
    }
    // History exists -> edit chapterId and lastVisited
    else {
        try {
            history.chapterId = chapterId ? chapterId : -1;
            history.lastVisited = utils.getCurrentDateTime();

            await history.save();

            log.info("Chỉnh sửa lịch sử xem thành công");
            res.json({code: 0, message: "Chỉnh sửa lịch sử xem thành công"});
        }
        catch (error){
            log.error(error.message);
            res.json({code: 1, message: "Chỉnh sửa lịch sử xem thất bại"});
        }
    }
}

async function remove(req, res) {
    let _id = req.params.id;
    let deletedHistory = await ReadingHistory.findOneAndDelete({ _id: _id }); // find one record and delete its if exists

    if(!deletedHistory) {
        log.error("Lịch sử xem không tồn tại");
        return res.json({code: 1, message: "Lịch sử xem không tồn tại"});
    }

    log.info("Xóa lịch sử xem thành công");
    res.json({code: 0, message: "Xóa lịch sử xem thành công"});
}

// remove all histories
async function clear(req, res) {
    let userId = req.params.userId;

    let user = await User.findOne({ _id: userId }); // find one record by id
    if(!user) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    let result = await ReadingHistory.deleteMany({userId: userId});
    if (result.deletedCount === 0) {
        log.error("Danh sách lịch sử xem hiện đang trống");
        return res.json({ code: 0, message: "Danh sách lịch sử xem hiện đang trống" });
    }

    log.info("Xóa tất cả lịch sử xem thành công");
    res.json({ code: 0, message: "Xóa tất cả lịch sử xem thành công" });
}

module.exports = {
    getAll,
    createAndEdit,
    remove,
    clear,
};