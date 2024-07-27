const { validationResult } = require('express-validator');

const Category = require("../models/category");
const log = require('../logs/log');

async function getAll(req, res) {
    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 5; // 5 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let categories;

    try {
        let total = await Category.countDocuments(); // Total records in database
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            categories = await Category.find().lean().skip(startIndex).limit(limit);
        else
            categories = await Category.find().lean().skip(startIndex);

        if (categories.length === 0) {
            log.info("Danh sách danh mục hiện đang trống");
            return res.json({code: 0, message: "Danh sách danh mục hiện đang trống", result: categories});
        }

        log.info("Lấy danh sách danh mục thành công");
        res.json({ code: 0, message: "Lấy danh sách danh mục thành công", result: categories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lấy danh sách danh mục thất bại" });
    }
}

function getOne(req, res) {
    Category.findOne({
        _id: req.params.id, // find one record by id
    })
    .then(result => {
        if(!result) {
            log.error("Danh mục không tồn tại");
            return res.json({code: 1, message: "Danh mục không tồn tại"});
        }

        log.info("Lấy thông tin danh mục thành công");
        res.json({code: 0, message: "Lấy thông tin danh mục thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Lấy thông tin danh mục thất bại"});
    });
}

function create(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let newCategory = new Category({
        categoryUrl: req.body.categoryUrl,
        categoryName: req.body.categoryName,
        categoryDescription: req.body.categoryDescription,
        isCategory: req.body.isCategory,
    });
    
    newCategory.save()
    .then(result => {        
        log.info("Tạo danh mục mới thành công");
        res.json({code: 0, message: "Tạo danh mục mới thành công", result: result});
    })
    .catch(error => {
        let errorMessage = error.message;
        log.error(errorMessage);

        // Check type of error
        if(errorMessage.includes("categoryUrl"))
            res.json({code: 1, message: "URL cho danh mục đã tồn tại"});
        else if(errorMessage.includes("categoryName"))
            res.json({code: 1, message: "Tên danh mục đã tồn tại"});
        else
            res.json({code: 1, message: "Tạo danh mục mới thất bại"});
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
        let category = await Category.findOne({ _id: _id }); // find one record by id

        if(!category) {
            log.error("Danh mục không tồn tại");
            return res.json({code: 1, message: "Danh mục không tồn tại"});
        }

        // Change fields of record
        category.categoryUrl = req.body.categoryUrl; 
        category.categoryName = req.body.categoryName; 
        category.categoryDescription = req.body.categoryDescription ? req.body.categoryDescription : category.categoryDescription ; 
        category.isCategory = req.body.isCategory; 

        await category.save();

        log.info("Chỉnh sửa danh mục thành công");
        res.json({code: 0, message: "Chỉnh sửa danh mục thành công"});
    }
    catch (error) {
        let errorMessage = error.message;
        log.error(errorMessage);

        // Check type of error
        if(errorMessage.includes("categoryUrl"))
            res.json({code: 1, message: "URL cho danh mục đã tồn tại"});
        else if(errorMessage.includes("categoryName"))
            res.json({code: 1, message: "Tên danh mục đã tồn tại"});
        else
            res.json({code: 1, message: "Chỉnh sửa danh mục thất bại"});
    }
}

async function remove(req, res) {
    let _id = req.params.id;
    let deletedCategory = await Category.findOneAndDelete({ _id: _id }); // find one record and delete its if exists

    if(!deletedCategory) {
        log.error("Danh mục không tồn tại");
        return res.json({code: 1, message: "Danh mục không tồn tại"});
    }

    log.info("Xóa danh mục thành công");
    res.json({code: 0, message: "Xóa danh mục thành công"});
}

async function search(req, res) {
    // // Input validation
    // let result = validationResult(req);
    // if(result.errors.length > 0) {
    //     log.error(result.errors[0].msg);
    //     return res.json({code: 1, message: result.errors[0].msg});
    // }

    let searchContent = req.query.searchContent || "";

    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 5; // 5 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let categories;

    try {
        let total = await Category.countDocuments({
            $or: [
                { _id: parseInt(searchContent) ? parseInt(searchContent) : -1 },
                { categoryName: { $regex: searchContent, $options: 'i' } },
            ]
          }); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            categories = await Category.find({
                $or: [
                    { _id: parseInt(searchContent) ? parseInt(searchContent) : -1 },
                    { categoryName: { $regex: searchContent, $options: 'i' } },
                ]
              }).lean().skip(startIndex).limit(limit);
        else
            categories = await Category.find({
                $or: [
                    { _id: parseInt(searchContent) ? parseInt(searchContent) : -1 },
                    { categoryName: { $regex: searchContent, $options: 'i' } },
                ]
              }).lean().skip(startIndex);
        
        if (categories.length === 0) {
            log.info("Không tìm thấy danh mục nào phù hợp");
            return res.json({code: 0, message: "Không tìm thấy danh mục nào phù hợp", result: categories});
        }

        log.info("Tìm danh mục thành công");
        res.json({ code: 0, message: "Tìm danh mục thành công", result: categories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Tìm danh mục thất bại" });
    }
}

async function sort(req, res) {
    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 5; // 5 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let categories;

    let criteria = {};

    if (req.query.criteria - 0 === 1)
        criteria._id = 1;
    else if (req.query.criteria - 0 === 2)
        criteria._id = -1;
    else if (req.query.criteria - 0 === 3)
        criteria.categoryName = 1;
    else if (req.query.criteria - 0 === 4)
        criteria.categoryName = -1;
    else
        ;
    
    try {
        let total = await Category.countDocuments(); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            categories = await Category.find().sort(criteria).lean().skip(startIndex).limit(limit);
        else
            categories = await Category.find().sort(criteria).lean().skip(startIndex);
        
        if (categories.length === 0) {
            log.info("Danh sách danh mục hiện đang trống");
            return res.json({code: 0, message: "Danh sách danh mục hiện đang trống", result: categories});
        }

        log.info("Sắp xếp danh sách danh mục thành công");
        res.json({ code: 0, message: "Sắp xếp danh sách danh mục thành công", result: categories, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Sắp xếp danh sách danh mục thất bại" });
    }
}

async function getAllWithoutPaging(req, res) {
    let categories;

    try {
        categories = await Category.find().lean()

        if (categories.length === 0) {
            log.info("Danh sách danh mục hiện đang trống");
            return res.json({code: 0, message: "Danh sách danh mục hiện đang trống", result: categories});
        }

        log.info("Lấy danh sách danh mục thành công");
        res.json({ code: 0, message: "Lấy danh sách danh mục thành công", result: categories});
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lấy danh sách danh mục thất bại" });
    }
}

module.exports = {
    getAll,
    getOne,
    create,
    edit,
    remove,
    search,
    sort,
    getAllWithoutPaging
};