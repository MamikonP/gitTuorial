import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
int count = 0;
String name = "";
String pass = "";
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/SecondPage": (BuildContext context) => new Registration(),
        "/ThirdPage": (BuildContext context) => new MyClass()
      },
  ));
}

class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(name,
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          backgroundColor: Colors.deepOrange,
          //leading: BackButton(),
          actions: <Widget>[
            SearchButton()
          ],
      ),
        body: new Container(
          padding: EdgeInsets.all(0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ProductName(),
                ProductName(),
                ProductName(),
                ProductName(),
                ProductName()
              ],
          ),
        )
    );
  }
}

class SearchButton extends StatefulWidget {
  @override
  SearchButtonState createState() => SearchButtonState();
}

class SearchButtonState extends State<SearchButton> {

  void onPressed() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
          children: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.search),
              onPressed: onPressed,
            )
          ],
        ),
    );
  }
}

class ProductName extends StatefulWidget {
  @override
  ProductNameState createState() => ProductNameState();
}

class ProductNameState extends State<ProductName>{
  var icon = Icon(Icons.sentiment_dissatisfied, color:Colors.red);
  bool blnIcon = false;
  int counter = 0;
  List<String> pNames = ["Banans", "Apricot", "Strawberry", "Cheese", "Apple"];
  void onPressed (){
    setState(() {
      if (blnIcon == false){
        icon = Icon(Icons.sentiment_satisfied, color:Colors.green);
        counter++;
        blnIcon = true;
      }
      else {
        icon = Icon(Icons.sentiment_dissatisfied, color: Colors.red);
        counter--;
        blnIcon = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (count >= pNames.length) {
      count = 0;
    }
    return new Container(
      padding: EdgeInsets.all(0),
      child: new Card(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new IconButton(
              icon: icon,
              onPressed: onPressed,
              alignment: Alignment.centerLeft,
            ),
            new Text(pNames[count++],
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0
                ),
                textAlign: TextAlign.left,
              ),
            new Text('$counter')
          ],
        ),
        ),
      );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Home Page"), backgroundColor: Colors.blueGrey,),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                  icon: Icon(Icons.add, color: Colors.blue,),
                  iconSize: 80.0,
                  onPressed: () {Navigator.of(context).pushNamed("/SecondPage");}
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Registration extends StatefulWidget {
  @override
  RegistrationState createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Registration"), backgroundColor: Colors.amber
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(inherit: true)
                ),
                onSubmitted: (String str) {
                  setState(() {
                    name = str;
                  });
                  controller.text = "";
                  {Navigator.of(context).pushNamed("/ThirdPage");}
                },
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}