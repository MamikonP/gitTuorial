import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyTextInput(),
  ));
}

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  String result = "";
  final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:new Text("Input Text"), backgroundColor: Colors.deepOrange
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Type in here!"
                ),
                /*onChanged: (String str) {
                  setState(() {
                    result = str;
                  });
                }
                ),*/
                onSubmitted: (String str) {
                  setState(() {
                  result = result + "\n" + str;
                  });
                  controller.text = "";
                },
                controller: controller,
              ),
              new Text(result)
            ],
          ),
        ),
      ),
    );
  }
}