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
    ISBNcode: String,
    publishDate: String,
    categoriesAndTags: Number,
    selfComposedStory: Boolean,
    matureContent: Boolean,
    published: Boolean,
    chapterCount: Number,
    viewCount: Number,
    voteCount: Number,
    commentCount: Number,
    ratingPoint: Number,
    createdDate: String,
    lastUpdate: String,
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