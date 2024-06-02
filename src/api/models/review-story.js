const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

const utils = require("../utils");

mongoose.Promise = global.Promise;
let Schema = mongoose.Schema;

// Define fields for the model
let reviewStorySchema = new Schema({
    // reviewId
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
    ratePoint: {
        type: Number,
        default: -1, // is a reply review (without ratePoint)
    },
    reviewContent: String,
    reviewTime: {
        type: String,
        default: utils.getCurrentDateTime(),
    },
    replyTo: {
        type: Number,
        default: -1, // not a reply review
    },

}, { versionKey: false });

// auto increment 
reviewStorySchema.plugin(autoIncrement.plugin, {
    model: "ReviewStory",
    field: '_id',
    startAt: 100000,
    incrementBy: 1
})

let ReviewStory = mongoose.model("ReviewStory", reviewStorySchema);
module.exports = ReviewStory