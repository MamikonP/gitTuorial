import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new AwesomeButton(),
  ));
}

class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() => new AwesomeButtonState();
}

class AwesomeButtonState extends State<AwesomeButton> {

  int counter = 0;
  List<String> strings = ["Flutter", "is", "Awesome"];
  String displayedString = "I Love Flutter";

  void onPressed() {
    setState(() {
      displayedString = strings[counter];
      counter = counter < 2 ? counter + 1 : 0;

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Statefull Widget"), backgroundColor: Colors.deepOrangeAccent,),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(displayedString,
                style: new TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                child: new Text("Press Me",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
                color: Colors.red,
                onPressed: onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}