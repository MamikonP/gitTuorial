import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main()=> runApp(new MaterialApp(
  home: MyClass(),
));

class MyClass extends StatefulWidget{
  @override
  MyClassState createState()=>MyClassState();
}

class MyClassState extends State<MyClass>{
  String url = 'https://randomuser.me/api/';
  Future<String> makeReuqest() async{
    http.Response response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Hom Page"),),
      body: new Center(
        child: new RaisedButton(
          onPressed: makeReuqest,
          child: new Text("Make Request"),
        ),
      ),
    );
  }
}