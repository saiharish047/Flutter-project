import 'dart:convert';

import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postRequest,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
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

  Future<void> getGraphQLRequest() async {
    var url = Uri.http('192.168.29.13:4000', '/graphql', {
      "query": '''{
        message
        }''',
    });
    http.Response response = await http.get(
      url,
    );
    print(response.body);
  }
}
