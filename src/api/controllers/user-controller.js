const bcrypt = require('bcryptjs');
const { validationResult } = require('express-validator');

const User = require("../models/user");
const log = require('../logs/log');

function register(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let newUser = new User({
        username: req.body.username, 
        password: bcrypt.hashSync(req.body.password, 10), // encrypt password
        email: req.body.email
    });

    // TODO: verify email when register new account
    
    newUser.save()
    .then(result => {        
        log.info("Đăng ký tài khoản thành công");
        res.json({code: 0, message: "Đăng ký tài khoản thành công", result: result});
    })
    .catch(error => {
        let errorMessage = error.message;
        log.error(errorMessage);

        // Check type of error
        if(errorMessage.includes("username"))
            res.json({code: 1, message: "Tài khoản này đã tồn tại"});
        else
            res.json({code: 1, message: "Đăng ký tài khoản thất bại"});
    });
}

function login(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }
        
    let {username, password} = req.body;

    User.findOne({
        $or: [
            { username: username},
            { email: username },
        ]
    })
    .then(async result => {
        if(!result) {
            log.error("Thông tin đăng nhập không chính xác");
            return res.json({code: 1, message: "Thông tin đăng nhập không chính xác"});
        }

        // compare encrypt password
        if(!bcrypt.compareSync(password, result.password)) {
            log.error("Thông tin đăng nhập không chính xác");
            return res.json({code: 1, message: "Thông tin đăng nhập không chính xác"});
        }

        if (username === "admin" || username === "nghiem782002@gmail.com") {
            // TODO: HANDLE LOGIN WITH ADMIN ROLE
            log.info("Admin đăng nhập thành công");
            return res.json({code: 100, message: "Admin đăng nhập thành công"});
        }
        
        log.info("Đăng nhập thành công");
        res.json({code: 0, message: "Đăng nhập thành công"});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Đăng nhập thất bại"});
    });
}

function getProfile(req, res) {
    let username = req.params.username;

    // NOTE: User cannot view the profile of admin
    if (username === "admin") {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    User.findOne({
        username: username, // find one record by username
    })
    .then(result => {
        if(!result) {
            log.error("Người dùng không tồn tại");
            return res.json({code: 1, message: "Người dùng không tồn tại"});
        }

        log.info("Lấy thông tin người dùng thành công");
        res.json({code: 0, message: "Lấy thông tin người dùng thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Lấy thông tin người dùng thất bại"});
    });
}

async function updateProfile(req, res) {
    try {
        // Input validation
        let result = validationResult(req);
        if(result.errors.length > 0) {
            log.error(result.errors[0].msg);
            return res.json({code: 1, message: result.errors[0].msg});
        }

        let user = await User.findOne({ _id: req.body._id }); // find one record by id

        if(!user) {
            log.error("Người dùng không tồn tại");
            return res.json({code: 1, message: "Người dùng không tồn tại"});
        }

        // Change fields of record
        user.displayName = req.body.displayName; 
        user.selfIntroduction = req.body.selfIntroduction ? req.body.selfIntroduction : user.selfIntroduction ; 
        user.dateOfBirth = req.body.dateOfBirth; 
        user.favGenreKeywords = req.body.favGenreKeywords ? req.body.favGenreKeywords : user.favGenreKeywords ;

        await user.save();

        log.info("Cập nhật hồ sơ người dùng thành công");
        res.json({code: 0, message: "Cập nhật hồ sơ người dùng thành công"});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Cập nhật hồ sơ người dùng thất bại"});
    }
}

module.exports = {
    register,
    login,
    getProfile,
    updateProfile,
};