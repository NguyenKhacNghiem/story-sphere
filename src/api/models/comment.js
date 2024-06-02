const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

const utils = require("../utils");

mongoose.Promise = global.Promise;
let Schema = mongoose.Schema;

// Define fields for the model
let commentSchema = new Schema({
    // comtId
    _id: {
        type: Number,
        unique: true,
        index: true,
    },
    userId: {
        type: Number,
        index: true,
    },
    chapterId: {
        type: Number,
        index: true,
    },
    atParagraph: {
        type: String,
        default: "",
    },
    comtContent: String,
    comtTime: {
        type: String,
        default: utils.getCurrentDateTime(),
    },
    replyTo: {
        type: Number,
        default: -1, // not a reply comment
    },

}, { versionKey: false });

// auto increment 
commentSchema.plugin(autoIncrement.plugin, {
    model: "Comment",
    field: '_id',
    startAt: 100000,
    incrementBy: 1
})

let Comment = mongoose.model("Comment", commentSchema);
module.exports = Comment