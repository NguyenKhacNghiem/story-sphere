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
    authorName: String,
    publisherName: String,
    ISBNcode: {
        type: String,
        unique: true,
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
            let day = today.getDate();
            let month = today.getMonth() + 1; 
            let year = today.getFullYear();

            return `${day}/${month}/${year}`;
        },
    },
    lastUpdate: {
        type: String,
        default: function() {
            let today = new Date();
            let day = today.getDate();
            let month = today.getMonth() + 1; 
            let year = today.getFullYear();
            
            return `${day}/${month}/${year}`;
        },
    },
    commercialActivated: Boolean,
    storySellPrice: Number,

}, { versionKey: false });

storySchema.plugin(autoIncrement.plugin, {
    model: "Story",
    field: '_id',
    startAt: 1,
    incrementBy: 1
})

let Story = mongoose.model("Story", storySchema);
module.exports = Story