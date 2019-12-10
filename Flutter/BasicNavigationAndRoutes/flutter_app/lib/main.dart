import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: HomePage(),
    routes: <String, WidgetBuilder>{
      // "/": (BuildContext context) => new HomePage(), // automatically define
      "/SecondPage": (BuildContext context) => new SecondPage()
      //"/Thirdpage" ....
    }
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:new Text("Home"), backgroundColor: Colors.deepOrange),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.favorite, color: Colors.redAccent,),
                  iconSize: 70.0,
                  onPressed: (){Navigator.of(context).pushNamed("/SecondPage");},
              ),
              new Text("Home"),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:new Text("Second Page"), backgroundColor: Colors.blueGrey),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.home, color: Colors.blueAccent),
                iconSize: 70.0,
                onPressed: null,
              ),
              new Text("Second Page"),
            ],
          ),
        ),
      ),
    );
  }
}