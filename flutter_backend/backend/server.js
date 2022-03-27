const express = require('express');

const app = express();

let messageJson = {message:'hello folks'};

app.use(express.json());

app.get('/message',(req,res)=> {
    res.send(messageJson);
});

app.listen(3000,()=>{
    console.log('runnning...');
});