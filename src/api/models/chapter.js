const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

mongoose.Promise = global.Promise;
let Schema = mongoose.Schema;

// Define fields for the model
let chapterSchema = new Schema({
    // chapterId
    _id: {
        type: Number,
        unique: true,
        index: true,
    },
    fk_storyId : Number, // _id of model Story
    chapterName : {
        type: String,
        index: true,
    },
    chapterUrlKey: {
        type: String,
        unique: true,
        index: true,
    },
    chapterOrder : Number,
    chapterStatus: Number, 
    matureContent : Boolean,
    viewCount: Number,
    voteCount : Number,
    commentCount : Number,
    wordsCount : Number,
    createDate : String,
    lastUpdate : String,
    commercialActivated : Boolean,
    chapterSellPrice : Number,
    
}, { versionKey: false });

chapterSchema.plugin(autoIncrement.plugin, {
    model: "Chapter",
    field: '_id',
    startAt: 1,
    incrementBy: 1
})

let Chapter = mongoose.model("Chapter", chapterSchema);
module.exports = Chapter