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
        default: "normal",
    },
    displayName: String,
    selfIntroduction: {
        type: String,
        default: "",
    },
    dateOfBirth: String,
    favGenreKeywords: {
        type: String,
        default: "",
    },
    accountBalance: {
        type: Number,
        default: 0,
    },
    
}, { versionKey: false });

userSchema.plugin(autoIncrement.plugin, {
    model: "User",
    field: '_id',
    startAt: 1,
    incrementBy: 1
})

let User = mongoose.model("User", userSchema);
module.exports = User