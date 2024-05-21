const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

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
        default: 0,
    },
    addedDate: {
        type: String,
        default: function() {
            let today = new Date();
            let day = String(today.getDate()).padStart(2, '0');
            let month = String(today.getMonth() + 1).padStart(2, '0'); 
            let year = today.getFullYear();
            let hours = String(today.getHours()).padStart(2, '0');
            let minutes = String(today.getMinutes()).padStart(2, '0');
            let seconds = String(today.getSeconds()).padStart(2, '0');

            return `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`; // default is the current date time
        },
    },
    
}, { versionKey: false });

// Ensures that userId and storyId are uniqueness together
favBookSchema.index({ userId: 1, storyId: 1 }, { unique: true });

// auto increment 
favBookSchema.plugin(autoIncrement.plugin, {
    model: "FavBook",
    field: '_id',
    startAt: 1,
    incrementBy: 1
})

let FavBook = mongoose.model("FavBook", favBookSchema);
module.exports = FavBook