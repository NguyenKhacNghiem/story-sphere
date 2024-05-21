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
    fk_storyId : {
        type: Number,
        index: true
    }, // _id of model Story
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
    chapterStatus: {
        type: Number,
        default: 1, // draft status is default
    }, 
    matureContent : Boolean,
    viewCount: {
        type: Number,
        default: 0,
    },
    voteCount : {
        type: Number,
        default: 0,
    },
    commentCount : {
        type: Number,
        default: 0,
    },
    wordsCount : Number,
    createDate : {
        type: String,
        default: function() {
            let today = new Date();
            let day = today.getDate();
            let month = today.getMonth() + 1; 
            let year = today.getFullYear();

            return `${day}/${month}/${year}`; // default is the current date
        },
    },
    lastUpdate : {
        type: String,
        default: function() {
            let today = new Date();
            let day = String(today.getDate()).padStart(2, '0');
            let month = String(today.getMonth() + 1).padStart(2, '0'); 
            let year = today.getFullYear();

            return `${day}/${month}/${year}`; // default is the current date
        },
    },
    commercialActivated : Boolean,
    chapterSellPrice : Number,
    
}, { versionKey: false });

// auto increment 
chapterSchema.plugin(autoIncrement.plugin, {
    model: "Chapter",
    field: '_id',
    startAt: 1,
    incrementBy: 1
})

let Chapter = mongoose.model("Chapter", chapterSchema);
module.exports = Chapter