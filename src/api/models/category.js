const mongoose = require("mongoose");
const autoIncrement = require("mongoose-plugin-autoinc");

mongoose.Promise = global.Promise;
let Schema = mongoose.Schema;

// Define fields for the model
let categorySchema = new Schema({
    // categoryId
    _id: {
        type: Number,
        unique: true,
        index: true,
    },
    categoryUrl: {
        type: String,
        unique: true,
        index: true,
    },
    categoryName : {
        type: String,
        unique: true,
        index: true,
    },
    categoryDescription: {
        type: String,
        default: "",
    },
    isCategory: {
        type: Boolean,
        default: true,
    },
    
}, { versionKey: false });

categorySchema.plugin(autoIncrement.plugin, {
    model: "Category",
    field: '_id',
    startAt: 1,
    incrementBy: 1
})

let Category = mongoose.model("Category", categorySchema);
module.exports = Category