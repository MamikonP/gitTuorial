import 'package:flutter/material.dart';
import 'package:flutter_animations/loader.dart';

void main()=>runApp(new MaterialApp(
  home: HomePage(),
));

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: new Center(
        child: new Loader(),
      ),
    );
  }
}