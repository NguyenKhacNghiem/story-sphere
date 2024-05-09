const { validationResult } = require('express-validator');

const Category = require("../models/category");
const log = require('../logs/log');

async function getAll(req, res) {
    let categories = await Category.find().lean();
    log.info("Lấy danh sách danh mục thành công");
    res.json({code: 0, message: "Lấy danh sách danh mục thành công", result: categories});
}

function getOne(req, res) {
    Category.findOne({
        _id: req.params.id,
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
        log.info("Tạo danh mục thành công");
        res.json({code: 0, message: "Tạo danh mục mới thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Tạo danh mục mới thất bại"});
    });
}

async function edit(req, res) {
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let _id = req.params.id;
    let category = await Category.findOne({ _id: _id });

    if(!category) {
        log.error("Danh mục không tồn tại");
        return res.json({code: 1, message: "Danh mục không tồn tại"});
    }

    category.categoryUrl = req.body.categoryUrl; 
    category.categoryName = req.body.categoryName; 
    category.categoryDescription = req.body.categoryDescription ? req.body.categoryDescription : category.categoryDescription ; 
    category.isCategory = req.body.isCategory; 

    await category.save();

    log.info("Chỉnh sửa danh mục thành công");
    res.json({code: 0, message: "Chỉnh sửa danh mục thành công"});
}

async function remove(req, res) {
    let _id = req.params.id;
    let deletedCategory = await Category.findOneAndDelete({ _id: _id });

    if(!deletedCategory) {
        log.error("Danh mục không tồn tại");
        return res.json({code: 1, message: "Danh mục không tồn tại"});
    }

    log.info("Xóa danh mục thành công");
    res.json({code: 0, message: "Xóa danh mục thành công"});
}

module.exports = {
    getAll,
    getOne,
    create,
    edit,
    remove
};