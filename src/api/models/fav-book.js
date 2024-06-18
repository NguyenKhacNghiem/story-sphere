const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

const utils = require("../utils");

mongoose.Promise = global.Promise;
let Schema = mongoose.Schema;

// Define fields for the model
let favBookSchema = new Schema({
    // favBookId
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
    readingProgressChapter: {
        type: Number,
        default: -1, // this story has no chapter
    },
    addedDate: {
        type: String,
        default: utils.getCurrentDateTime(),
    },
    
}, { versionKey: false });

// Ensures that userId and storyId are uniqueness together
favBookSchema.index({ userId: 1, storyId: 1 }, { unique: true });

// auto increment 
favBookSchema.plugin(autoIncrement.plugin, {
    model: "FavBook",
    field: '_id',
    startAt: 100000,
    incrementBy: 1
})

let FavBook = mongoose.model("FavBook", favBookSchema);
module.exports = FavBook