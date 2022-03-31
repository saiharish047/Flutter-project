const mongoose = require('mongoose');
const CourseSchema = mongoose.Schema({
    id:{
        type: Number,
        required:true,
    },
    title:{
        type:String,
        required: true,
    },
    description:{
        type:String,
        required:false,
    }
});

module.exports = mongoose.model('Course',CourseSchema);