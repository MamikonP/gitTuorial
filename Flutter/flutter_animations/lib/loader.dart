import 'package:flutter/material.dart';

class Loader extends StatefulWidget{
  LoaderState createState()=> new LoaderState();
}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState(){
    super.initState();
    controller = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1200));
    animation = new CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    animation.addListener(() {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});
    controller.repeat();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 100.0,
        ),
        new Padding(padding: EdgeInsets.only(bottom: 3.0)),
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 75.0,
        ),
        new Padding(padding: EdgeInsets.only(bottom: 3.0)),
        new Container(
          color: Colors.white,
          height: 3.0,
          width: animation.value * 50.0,
        ),
      ],
    );
  }
}