const express = require('express');

//Used when we want file handling
const fs = require("fs");
const { json } = require('stream/consumers');
const app = express();

//Normally used when we have any request bodies to handle
const bodyParser = require('body-parser');

//Used when we have content-type for request bodies as application/json
//Enables nodejs to parse those request bodies and allow us to work with them.
//can also use 
//app.use(express.json());
app.use(bodyParser.json());

//Used when we have text/plain content types coming as request body.
//This enables nodejs to parse those requests and enable us to work with the req.body.
//If we have both json and text bodyParsers, it will still use the text bodyParser
app.use(bodyParser.text());

//Code for handling what to do when the server receives post requests.
app.post('/message',(req,res)=>{
    fs.readFile(__dirname+"/storage/messages.json",
    //this function enables us to work with the request that is coming. 
    //Mainly used for accessing the request.body and using it
    (err,data)=>{
        //JSON.parse will parse the data from the file and turns it into a json object. 
        //Will only work if the content in the file is a valid json object.
        var jsonData =JSON.parse(data)
        
        //used to merge two objects
        var finalData = {...jsonData,...JSON.parse(req.body)};
    
        //will write the data in the second argument of the function to the filePath. if file exists, existing data is replaced.
        //JSON.stringify will take a json object and convert to a string. We use it here because we need the string to be added to te file
        fs.writeFile(__dirname+"/storage/messages.json",JSON.stringify(finalData),(err)=>{});
    });
    res.send('Updated successfully');
});


//Code for handling what to do when the server receives a get request. First argument serves as an extension to the server url.
//Example: given code will work if the get request is sent to http://<ip_address>:<portNumber>/message
app.get('/message',(req,res)=> {
    res.send(fs.readFileSync(__dirname+"/storage/messages.json"));
});

//we can define multiple gets for a code
//app.get('/posts',(req,res)=> {
//    res.send(fs.readFileSync(__dirname+"/storage/messages.json"));
//});


//Specifies the port number which the server will listen to
app.listen(3000,()=>{
    console.log('runnning...');
});