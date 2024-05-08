const bcrypt = require('bcryptjs');
const { validationResult } = require('express-validator');

const User = require("../models/user");

function register(req, res) {
    let result = validationResult(req);

    if(result.errors.length > 0)
        return res.json({code: 1, message: result.errors[0].msg});

    let newUser = new User({
        username: req.body.username, 
        password: bcrypt.hashSync(req.body.password, 10), 
        email: req.body.email,
        displayName: req.body.displayName, 
        selfIntroduction: req.body.selfIntroduction,
        dateOfBirth: req.body.dateOfBirth,
    });
    
    newUser.save()
    .then(result => {        
        res.json({code: 0, message: "Đăng ký tài khoản thành công", result: result});
    })
    .catch(error => {
        res.json({code: 1, message: "Tài khoản này đã tồn tại"});
    });
}

function login(req, res) {
    let result = validationResult(req);

    if(result.errors.length > 0)
        return res.json({code: 1, message: result.errors[0].msg});

    let {username, password} = req.body;

    User.findOne({
        username: username,
    })
    .then(async result => {
        if(!result) 
            return res.json({code: 1, message: "Tài khoản hoặc mật khẩu không chính xác"});

        if(!bcrypt.compareSync(password, result.password))
            return res.json({code: 1, message: "Tài khoản hoặc mật khẩu không chính xác"});

        res.json({code: 0, message: "Đăng nhập thành công"});
    })
    .catch(error => {
        throw new Error(error.message);
    });
}

module.exports = {
    register,
    login
};