const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

mongoose.Promise = global.Promise;
let Schema = mongoose.Schema;

// Define fields for the model
let userSchema = new Schema({
    // userId
    _id: {
        type: Number,
        unique: true,
        index: true,
    },
    username: {
        type: String,
        unique: true,
        index: true,
    },
    password: String,
    email: String,
    role: {
        type: String,
        default: "user",
    },
    displayName: {
        type: String,
        default: "Người dùng Story Sphere" // default display name when register new account
    },
    selfIntroduction: {
        type: String,
        default: "",
    },
    dateOfBirth: {
        type: String,
        default: "",
    },
    favGenreKeywords: {
        type: String,
        default: "",
    },
    accountBalance: {
        type: Number,
        default: 0,
    },
    
}, { versionKey: false });

// auto increment 
userSchema.plugin(autoIncrement.plugin, {
    model: "User",
    field: '_id',
    startAt: 100000,
    incrementBy: 1
})

let User = mongoose.model("User", userSchema);
module.exports = User