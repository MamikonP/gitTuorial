import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main()=>runApp(new MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=>HomePageState();
}

class HomePageState extends State<HomePage>{

  List data;

  Future<String> getData() async{
    String url = "https://jsonplaceholder.typicode.com/posts/";
    http.Response response = await http.get(Uri.encodeFull(url), headers: {"Accept":"application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });
    return "Success!";
  }
  
  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("List Views"),),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}