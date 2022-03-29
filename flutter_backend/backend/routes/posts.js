const express = require('express');
const router = express.Router();
const Post = require('../models/Posts')


router.get('/', (request, response) => {
    response.send('we are on post page');
});

//this is the post method.

router.post('/',(request,response)=>{
    console.log(request.body);
    //we get the response and store is in a form of our data model
    const post = new Post({ 
        title:request.body.title,
        description:request.body.description,
    });
    //post.save returns a promise on which we can do then(). However this data needs to be parsed to be shown on FE
   post.save().then(data=>{
        console.log(response.json(data));
        response.json(data);
        response.end(); //need to configure this tomm. Once done with data manipulation need to close the response state
   }).catch(err=>{  //error callbacks are required 
       console.log(err);
       response.json({
           message:err
       });
       response.end();
   });
    
});




module.exports = router;