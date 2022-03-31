var root = require('./routes/graphql_routes');
require('dotenv/config') //dot env is used to store secureData like the mongoDB url.
const mongoose = require('mongoose'); //mongoose is a required package to connect to Mongo DB
var express = require('express');
var express_graphql = require('express-graphql').graphqlHTTP;
var { buildSchema } = require('graphql');
// GraphQL schema
// Whatever queries we might need to make, we add to the Query object here
// Whatever will be in query object will also be assigned a function in root object 
//to define what should happen on query call
//The format for adding inside Query should be function name(args):return type.
//If no arguments, can be omitted entirely 
//We should also add any new objects/types we are creating for eg. Person{id:Int,name:String)}

var schema = buildSchema(`
    type Query {
        message: String
    }
`);
// // Root resolver
// //defines what should happen on a particular query call
// var root = {
//     message: () => 'Hello World!'
// };

// Create an express server and a GraphQL endpoint
var app = express();
app.use('/graphql', express_graphql({
    schema: schema,
    rootValue: root,
    graphiql: true
}));

//connect to the DB.
mongoose.connect( 
    process.env.DB_CONNECTION,  //This DB connection needs to come from a secure file.
    (err) => {
        if(err) console.log(err) //check if any error whilst connecting to DB
        else console.log('connected to DB!!!');
    });


app.listen(4000, () => console.log('Express GraphQL Server Now Running On localhost:4000/graphql'));