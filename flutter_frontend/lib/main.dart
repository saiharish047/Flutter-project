import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage/view/home_page_view.dart';
import 'package:flutter_application_1/widgets/home_page/twitter_home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

//a post request sent to the node server
Future<void> postRequest() async {
  var uri = Uri.parse('http://192.168.29.13:3000/message');
  //await http.post(uri);

  http.Response response = await http.post(
    uri,
    //content type can be text/plain,application/json depending on what we are using.
    //If we use application/json, we have to have a body-parser in our server for handling json request body.
    //Can be set up using app.use(express.json()) in our nodejs server code
    headers: {"Content-Type": "text/plain"},
    body: jsonEncode(
      {'When': 'Where'},
    ),
  );
}

//a get request sent to the node server
Future<void> getRequest() async {
  var uri = Uri.parse('http://192.168.29.13:3000/message');
  http.Response response = await http.get(
    uri,
  );
  print(response);
}

//graphql get request sent to graphql_server
Future<void> getCourseById() async {
  int courseID = 123;
  var url = Uri.http('192.168.29.13:4000', '/graphql', {
    "query": '''{
        getCourse(id:$courseID){id,title,description}
        }''',
  });
  http.Response response = await http.get(
    url,
  );
  print(response.body);
}

//graphql get request sent to graphql_server
Future<void> getAllCourses() async {
  var url = Uri.http('192.168.29.13:4000', '/graphql', {
    "query": '''{
        getAllCourses{id,title,description}
      }'''
  });

  http.Response response = await http.get(url);
  print(response.body);
}

//post request to graphql_server
Future<void> addCourse() async {
  var id = 1000;
  var title = 'Chemistry';
  var description = 'Very interesting subject';
  var url = Uri.http(
    '192.168.29.13:4000',
    '/graphql',
    {
      "query": '''mutation {
          addCourse(id:$id,title:"$title",description:"$description")
          }''',
    },
  );
  http.Response response = await http.post(url);
  print(response.body);
}
