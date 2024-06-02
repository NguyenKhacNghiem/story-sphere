const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

mongoose.Promise = global.Promise;
let Schema = mongoose.Schema;

// Define fields for the model
let storySchema = new Schema({
    // storyId
    _id: {
        type: Number,
        unique: true,
        index: true,
    },
    storyName: {
        type: String,
        index: true,
    },
    url: {
        type: String,
        unique: true,
    },
    cover: String,
    contentOutline: String,
    fk_publisherAccount: String, // username of model User
    authorName: {
        type: String,
        index: true,
    },
    publisherName: String,
    ISBNcode: {
        type: String,
        unique: true,
        index:true,
    },
    publishDate: String,
    categoriesAndTags: String,
    selfComposedStory: Boolean,
    matureContent: Boolean,
    published: {
        type: Boolean,
        default: false,
    },
    chapterCount: Number,
    viewCount: {
        type: Number,
        default: 0,
    },
    voteCount: {
        type: Number,
        default: 0,
    },
    commentCount: {
        type: Number,
        default: 0,
    },
    ratingPoint: {
        type: Number,
        default: 0,
    },
    createdDate: {
        type: String,
        default: function() {
            let today = new Date();
            let day = String(today.getDate()).padStart(2, '0');
            let month = String(today.getMonth() + 1).padStart(2, '0'); 
            let year = today.getFullYear();

            return `${day}/${month}/${year}`; // default is the current date
        },
    },
    lastUpdate: {
        type: String,
        default: function() {
            let today = new Date();
            let day = String(today.getDate()).padStart(2, '0');
            let month = String(today.getMonth() + 1).padStart(2, '0'); 
            let year = today.getFullYear();

            return `${day}/${month}/${year}`; // default is the current date
        },
    },
    commercialActivated: Boolean,
    storySellPrice: Number,

}, { versionKey: false });

// auto increment 
storySchema.plugin(autoIncrement.plugin, {
    model: "Story",
    field: '_id',
    startAt: 100000,
    incrementBy: 1
})

let Story = mongoose.model("Story", storySchema);
module.exports = Story