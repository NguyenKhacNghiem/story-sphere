const bcrypt = require('bcryptjs');
const { validationResult } = require('express-validator');

const User = require("../models/user");
const log = require('../logs/log');
const utils = require("../utils");

async function getAll(req, res) {
    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 5; // 5 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let users;

    try {
        let total = await User.countDocuments({role: {$ne: "admin"} }); // Total records in database
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            users = await User.find({role: {$ne: "admin"} }).lean().skip(startIndex).limit(limit);
        else
            users = await User.find({role: {$ne: "admin"} }).lean().skip(startIndex);

        if (users.length === 0) {
            log.info("Danh sách người dùng hiện đang trống");
            return res.json({code: 0, message: "Danh sách người dùng hiện đang trống", result: users});
        }

        log.info("Lấy danh sách người dùng thành công");
        res.json({ code: 0, message: "Lấy danh sách người dùng thành công", result: users, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Lấy danh sách người dùng thất bại" });
    }
}

async function register(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let {username, password, email} = req.body;

    let user;

    user = await User.findOne({username: username});
    if(user) {
        log.error("Tài khoản này đã tồn tại");
        return res.json({code: 1, message: "Tài khoản này đã tồn tại"});
    }

    user = await User.findOne({email: email});
    if(user) {
        log.error("Email này đã tồn tại");
        return res.json({code: 1, message: "Email này đã tồn tại"});
    }
    
    // NOTE: verify email when register new account
    let otp = Math.floor(Math.random() * (9999 - 1000 + 1)) + 1000; // random OTP code in [1000, 9999]
    utils.sendEmail(email, otp);

    req.session.username = username;
    req.session.password = password;
    req.session.email = email;
    // req.session.otp = otp;

    res.json({code: 0, message: "Vui lòng nhập mã OTP được gửi đến email của bạn"});
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
        user.avatar = req.body.avatar ? req.body.avatar : user.avatar ; 
        user.bgImg = req.body.bgImg ? req.body.bgImg : user.bgImg ; 

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
            return res.json({code: 1, message: result.errors[0].msg});
        }

        let {email, password} = req.body;

        let user = await User.findOne({ email: email });
        if(!user) {
            log.error("Người dùng không tồn tại");
            return res.json({code: 1, message: "Người dùng không tồn tại"});
        }

        // Change fields of record
        user.password = bcrypt.hashSync(password, 10) ;
        await user.save();

        log.info("Đặt lại mật khẩu thành công");
        res.json({code: 0, message: "Đặt lại mật khẩu thành công"});
    }
    catch (error) {
        log.error(error.message);
        res.json({code: 1, message: "Đặt lại mật khẩu thất bại"});
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
    let users;

    try {
        let total = await User.countDocuments({
            $or: [
              { _id: parseInt(searchContent) ? parseInt(searchContent) : -1 },
              { username: { $regex: searchContent, $options: 'i' } },
              { email: { $regex: searchContent, $options: 'i' } },
              { displayName: searchContent }
            ],
            role: {$ne: "admin"}
          }); // Total records in database by a condition

        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            users = await User.find({
                $or: [
                    { _id: parseInt(searchContent) ? parseInt(searchContent) : -1 },
                    { username: { $regex: searchContent, $options: 'i' } },
                    { email: { $regex: searchContent, $options: 'i' } },
                    { displayName: searchContent }
                ],
                role: {$ne: "admin"}
              }).lean().skip(startIndex).limit(limit);
        else
            users = await User.find({
                $or: [
                    { _id: parseInt(searchContent) ? parseInt(searchContent) : -1 },
                    { username: { $regex: searchContent, $options: 'i' } },
                    { email: { $regex: searchContent, $options: 'i' } },
                    { displayName: searchContent }
                ],
                role: {$ne: "admin"}
              }).lean().skip(startIndex);
        
        if (users.length === 0) {
            log.info("Không tìm thấy người dùng nào phù hợp");
            return res.json({code: 0, message: "Không tìm thấy người dùng nào phù hợp", result: users});
        }

        log.info("Tìm người dùng thành công");
        res.json({ code: 0, message: "Tìm người dùng thành công", result: users, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Tìm người dùng thất bại" });
    }
}

async function sort(req, res) {
    // Paging
    let page = parseInt(req.query.page) || 1; // current page, default is 1
    let limit = 5; // 5 records per page
    let startIndex = (page - 1) * limit; // Index of the first record on current page
    let endIndex = page * limit; // Index of the last record on current page
    let users;

    let criteria = {};

    if (req.query.criteria - 0 === 1)
        criteria._id = 1;
    else if (req.query.criteria - 0 === 2)
        criteria._id = -1;
    else if (req.query.criteria - 0 === 3)
        criteria.username = 1;
    else if (req.query.criteria - 0 === 4)
        criteria.username = -1;
    else if (req.query.criteria - 0 === 5)
        criteria.displayName = 1;
    else if (req.query.criteria - 0 === 6)
        criteria.displayName = -1;
    else
        ;
    
    try {
        let total = await User.countDocuments({role: {$ne: "admin"}}); // Total records in database by a condition
        let totalPages = Math.ceil(total / limit); // Total pages

        if (endIndex < total)
            users = await User.find({role: {$ne: "admin"}}).sort(criteria).lean().skip(startIndex).limit(limit);
        else
            users = await User.find({role: {$ne: "admin"}}).sort(criteria).lean().skip(startIndex);
        
        if (users.length === 0) {
            log.info("Danh sách người dùng hiện đang trống");
            return res.json({code: 0, message: "Danh sách người dùng hiện đang trống", result: users});
        }

        log.info("Sắp xếp danh sách người dùng thành công");
        res.json({ code: 0, message: "Sắp xếp danh sách người dùng thành công", result: users, totalPages: totalPages, currentPage: page });
    } catch (err) {
        log.error(err.message);
        res.json({ code: 1, message: "Sắp xếp danh sách người dùng thất bại" });
    }
}

async function lock(req, res) {
    // Input validation
    let result = validationResult(req);
    if(result.errors.length > 0) {
        log.error(result.errors[0].msg);
        return res.json({code: 1, message: result.errors[0].msg});
    }

    let _id = req.body._id;
    let user = await User.findOne({ _id: _id }); // find one record by id

    if(!user) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    // Change fields of record
    user.isLock ? user.isLock = false : user.isLock = true;

    await user.save();

    user.isLock ? log.info("Khóa tài khoản người dùng thành công") : log.info("Mở khóa tài khoản người dùng thành công");
    user.isLock ? res.json({code: 0, message: "Khóa tài khoản người dùng thành công"}) : res.json({code: 0, message: "Mở khóa tài khoản người dùng thành công"});
}

async function remove(req, res) {
    let _id = req.params.id;
    let deletedUser = await User.findOneAndDelete({ _id: _id }); // find one record and delete its if exists

    if(!deletedUser) {
        log.error("Người dùng không tồn tại");
        return res.json({code: 1, message: "Người dùng không tồn tại"});
    }

    log.info("Xóa người dùng thành công");
    res.json({code: 0, message: "Xóa người dùng thành công"});
}

function saveUser(req, res) {
    let username = req.session.username;
    let password = req.session.password;
    let email = req.session.email;
    // let otp = req.session.otp;

    // if (req.body.otp - 0 !== otp) {
    //     log.error("Mã OTP không chính xác.");
    //     return res.json({code: 1, message: "Mã OTP không chính xác."});
    // }

    let newUser = new User({
        username: username, 
        password: bcrypt.hashSync(password, 10), // encrypt password
        email: email
    });

    newUser.save()
    .then(result => {        
        delete req.session.username;
        delete req.session.password;
        delete req.session.email;
        // delete req.session.otp;

        log.info("Đăng ký tài khoản thành công");
        res.json({code: 0, message: "Đăng ký tài khoản thành công", result: result});
    })
    .catch(error => {
        log.error(error.message);
        res.json({code: 1, message: "Đăng ký tài khoản thất bại"});
    });
}

module.exports = {
    getAll,
    register,
    login,
    getProfile,
    updateProfile,
    updateFavGenreKeywords,
    updateEmail,
    changePassword,
    forgetPassword,
    verifyEmail,
    search,
    sort,
    lock,
    remove,
    saveUser
};