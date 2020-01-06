import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main()=> runApp(new MaterialApp(
  home: MyClass(),
));

class MyClass extends StatefulWidget{
  @override
  MyClassState createState()=>MyClassState();
}

class MyClassState extends State<MyClass>{
  //String url = 'https://randomuser.me/api/';
  String url = 'https://jsonplaceholder.typicode.com/posts/';
  Future<String> makeReuqest() async{
    http.Response response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    //List data;
    //var extractdata = json.decode(response.body);
    //data = extractdata["results"];
    //print(data[0]["name"]);
    List data = json.decode(response.body);
    print(data[1]["title"]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Home Page"),),
      body: new Center(
        child: new RaisedButton(
          onPressed: makeReuqest,
          child: new Text("Make Request"),
        ),
      ),
    );
  }
}