
// Root resolver
const { json } = require('body-parser');
const e = require('express');
const mongoose = require('mongoose'); //mongoose is a required package to connect to Mongo DB
const { listenerCount } = require('process');
const Course = require('../models/Course');
require('dotenv/config')
//connect to the DB.
mongoose.connect( 
    process.env.DB_CONNECTION,  //This DB connection needs to come from a secure file.
    (err) => {
        if(err) console.log(err) //check if any error whilst connecting to DB
        else console.log('connected to DB!!!');

    });

//defines what should happen on a particular query call
let roots = {
    getCourse: getCourse,
    getAllCourses: getAllCourses,
    addCourse: addCourse,
};

function addCourse(args){
    const course = new Course({
        id: args.id,
        title:args.title,
        description:args.description,
    });

    course.save().then(data=>{
        console.log(data);
        //response.end(); //need to configure this tomm. Once done with data manipulation need to close the response state
   }).catch(err=>{  //error callbacks are required 
       console.log(err);
    //    response.end();
   });

   return 'Course added';
}


async function getAllCourses(){
    var list = [];
    await Course.find().then((data)=>{
      data.forEach((element)=>list.push({
          id:element.id,
          title: element.title,
          description: element.description,
      }));
     }
    );

    return list;
}

async function getCourse(args){
    var course;
    await Course.findOne({id:args.id}).then((data)=>{
        console.log(data);
        course = {
            id: data.id,
            title: data.title,
            description:data.description,
        }
    });
    return course;
}

module.exports = roots;