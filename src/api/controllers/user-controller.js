const bcrypt = require('bcryptjs');
const { validationResult } = require('express-validator');

const User = require("../models/user");
const log = require('../logs/log');
const utils = require("../utils");

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
        else if(errorMessage.includes("email"))
            res.json({code: 1, message: "Email này đã tồn tại"});
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
        
        if (result.isLock) {
            log.info("Tài khoản của bạn đã bị khóa");
            return res.json({code: 1, message: "Tài khoản của bạn đã bị khóa", userId: result._id});
        }

        // Admin login
        if (result.role === "admin") {
            log.info("Admin đăng nhập thành công");
            return res.json({code: 100, message: "Admin đăng nhập thành công", userId: result._id});
        }
        
        log.info("Đăng nhập thành công");
        res.json({code: 0, message: "Đăng nhập thành công", userId: result._id});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Đăng nhập thất bại"});
    });
}

function getProfile(req, res) {
    let value = req.params.id; // req.params.id is _id, username or email

    User.findOne({
        $or: [
            { _id: parseInt(value) ? parseInt(value) : -1 },
            { username: value },
            { email: value }
        ]
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

        await user.save();

        log.info("Cập nhật hồ sơ người dùng thành công");
        res.json({code: 0, message: "Cập nhật hồ sơ người dùng thành công"});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Cập nhật hồ sơ người dùng thất bại"});
    }
}

async function updateFavGenreKeywords(req, res) {
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
        user.favGenreKeywords = req.body.favGenreKeywords ? req.body.favGenreKeywords : user.favGenreKeywords ;
        await user.save();

        log.info("Cập nhật thể loại yêu thích thành công");
        res.json({code: 0, message: "Cập nhật thể loại yêu thích thành công"});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Cập nhật thể loại yêu thích thất bại"});
    }
}

async function updateEmail(req, res) {
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
        user.email = req.body.email ;
        await user.save();

        log.info("Cập nhật email thành công");
        res.json({code: 0, message: "Cập nhật email thành công"});
    }
    catch (error) {
        let errorMessage = error.message;
        log.error(errorMessage);

        // Check type of error
        if(errorMessage.includes("email"))
            res.json({code: 1, message: "Email này đã tồn tại"});
        else
            res.json({code: 1, message: "Cập nhật email thất bại"});
    }
}

async function changePassword(req, res) {
    try {
        // Input validation
        let result = validationResult(req);
        if(result.errors.length > 0) {
            log.error(result.errors[0].msg);
            return res.json({code: 1, message: result.errors[0].msg});
        }

        let {_id, oldPassword, password} = req.body;

        let user = await User.findOne({ _id: _id }); // find one record by id
        if(!user) {
            log.error("Người dùng không tồn tại");
            return res.json({code: 1, message: "Người dùng không tồn tại"});
        }

        if(!bcrypt.compareSync(oldPassword, user.password)) {
            log.error("Mật khẩu cũ không chính xác");
            return res.json({code: 1, message: "Mật khẩu cũ không chính xác"});
        }

        // Change fields of record
        user.password = bcrypt.hashSync(password, 10) ;
        await user.save();

        log.info("Đổi mật khẩu thành công");
        res.json({code: 0, message: "Đổi mật khẩu thành công"});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Đổi mật khẩu thất bại"});
    }
}

async function forgetPassword(req, res) {
    try {
        // Input validation
        let result = validationResult(req);
        if(result.errors.length > 0) {
            log.error(result.errors[0].msg);
            return res.json({code: 1, message: result.errors[0].msg, userId: _id});
        }

        let {_id, password} = req.body;

        let user = await User.findOne({ _id: _id }); // find one record by id
        if(!user) {
            log.error("Người dùng không tồn tại");
            return res.json({code: 1, message: "Người dùng không tồn tại", userId: _id});
        }

        // Change fields of record
        user.password = bcrypt.hashSync(password, 10) ;
        await user.save();

        log.info("Đặt lại mật khẩu thành công");
        res.json({code: 0, message: "Đặt lại mật khẩu thành công", userId: _id});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Đặt lại mật khẩu thất bại", userId: _id});
    }
}

// Verify email when forget password or update new email
function verifyEmail(req, res) {
    try {
        // Input validation
        let result = validationResult(req);
        if(result.errors.length > 0) {
            log.error(result.errors[0].msg);
            return res.json({code: 1, message: result.errors[0].msg});
        }

        let email = req.body.email;
        let otp = Math.floor(Math.random() * (9999 - 1000 + 1)) + 1000; // random OTP code in [1000, 9999]
        
        utils.sendEmail(email, otp)
        res.json({code: 0, message: "Xác thực email thành công", email: email, otp: otp});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Xác thực email thất bại"});
    }
}

// TODO: Update avatar and bgImg

module.exports = {
    register,
    login,
    getProfile,
    updateProfile,
    updateFavGenreKeywords,
    updateEmail,
    changePassword,
    forgetPassword,
    verifyEmail,
};