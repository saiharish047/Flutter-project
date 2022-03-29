const express = require('express');
const app = express();
const mongoose = require('mongoose'); //mongoose is a required package to connect to Mongo DB
const bodyParser = require('body-parser');
require('dotenv/config') //dot env is used to store secureData like the mongoDB url.

app.use(bodyParser.json());

//import Routes
const postRoutes = require('./routes/posts'); 

app.use('/posts',postRoutes);

//connect to the DB.
mongoose.connect( 
process.env.DB_CONNECTION,  //This DB connection needs to come from a secure file.
(err) => {
    if(err) console.log(err) //check if any error whilst connecting to DB
    else console.log('connected to DB!!!');
});

/*
Few things on mongoDB if you are using it.
Add your IP to the DB before connecting. (whitelisting IP )
Also your password for the database(not the account) shouldnt contain special symbols or while connecting u need to send 
it as ASCII value.

once u click connect on the main page go to connect you application to your cluster option and ull get the url which needs to be used.
*/

app.listen(3000);