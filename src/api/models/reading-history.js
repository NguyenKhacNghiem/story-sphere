const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

const utils = require("../utils");

mongoose.Promise = global.Promise;
let Schema = mongoose.Schema;

// Define fields for the model
let readingHistorySchema = new Schema({
    // readingHistoryId
    _id: {
        type: Number,
        unique: true,
        index: true,
    },
    userId: {
        type: Number,
        index: true,
    },
    storyId: {
        type: Number,
        index: true,
    },
    chapterId: {
        type: Number,
        default: -1, // this story has no chapter
    },
    lastVisited: {
        type: String,
        default: utils.getCurrentDateTime(),
    },
    
}, { versionKey: false });

// auto increment 
readingHistorySchema.plugin(autoIncrement.plugin, {
    model: "ReadingHistory",
    field: '_id',
    startAt: 100000,
    incrementBy: 1
})

let ReadingHistory = mongoose.model("ReadingHistory", readingHistorySchema);
module.exports = ReadingHistory