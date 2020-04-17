const mongoose = require('mongoose');
const moongosePaginate = require('mongoose-paginate');

const ProductSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    price: {
        type: String,
        required: true,
    },
    imgUrlColorOne: {
        type: String,
        required: true,
    },
    imgUrlColorTwo:{
        type: String,
        required: true,
    },
    createdAt:{
        type: Date,
        default: Date.now,
    }
});

ProductSchema.plugin(moongosePaginate);

module.exports = mongoose.model('Product',ProductSchema);