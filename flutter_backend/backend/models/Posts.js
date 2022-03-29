const mongoose = require('mongoose');
//Schema are like data model on the front end. We send the data in this format from the FE and get it here.
const PostSchema = mongoose.Schema({ 
    title:{
        type:String,
        required:true,
    },
    description:{
            type:String,
            required:true,
    },
    date:{
        type:Date,
        default:Date.now,
    }
});

module.exports = mongoose.model('Posts',PostSchema); // module.export is used to import this class in another file