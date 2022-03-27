const express = require('express');
const fs = require("fs");
const app = express();
app.use(express.json());

app.post('/message',(req,res)=>{
    console.log(req.body);
    fs.appendFile(__dirname+"/storage/messages.json", req.body['data']);
    res.send('Updated successfully');
});

app.get('/message',(req,res)=> {
    res.send(fs.readFileSync(__dirname+"/storage/messages.json"));
});

app.listen(3000,()=>{
    console.log('runnning...');
});