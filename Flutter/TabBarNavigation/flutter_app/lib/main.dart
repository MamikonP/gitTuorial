import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;

void main(){
  runApp(new MaterialApp(
    home: MyTabs(),
  ));
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Pages"),
        backgroundColor: Colors.deepOrange,
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.arrow_forward)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_back)),
          ],
        ),
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.arrow_forward)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_back)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third(),
        ],
      ),
    );
  }
}