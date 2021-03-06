var root = require('./routes/graphql_routes');
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
        getAllCourses: [Course],
        getCourse(id:Int!): Course,
    }
    type Mutation{
        addCourse(id:Int!,title:String!,description:String):String,
    }
    type Course{
        id: Int!
        title: String!
        description: String
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


app.listen(4000, () => console.log('Express GraphQL Server Now Running On localhost:4000/graphql'));