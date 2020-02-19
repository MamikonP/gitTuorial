import 'package:flutter/material.dart';
import 'dart:math';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LoadingPage(),
));

class LoadingPage extends StatefulWidget{
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animationIn;
  Animation<double> animationOut;
  Animation<double> animationRotate;

  final double initialRadius = 30.0;
  double radius = 30.0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 5));

    animationIn = Tween<double>(begin: 1.0,end: 0.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animationOut = Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener((){
      setState(() {
        if(controller.value >= 0.75 && controller.value <= 1.0){
          radius = animationIn.value * initialRadius;
        }else if(controller.value >= 0.0 && controller.value <= 0.25){
          radius = animationOut.value * initialRadius;
        }
      });
    });

    animationRotate = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Loading animation"),
      ),
      body: Center(
        child: RotationTransition(
          turns: animationRotate,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 30.0,
                color: Colors.grey,
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi/4), radius * sin(pi/4)),
                child: Dot(
                  radius: 10.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(2 * pi/4), radius * sin(2 * pi/4)),
                child: Dot(
                  radius: 10.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(3 * pi/4), radius * sin(3 * pi/4)),
                child: Dot(
                  radius: 10.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(4 * pi/4), radius * sin(4 * pi/4)),
                child: Dot(
                  radius: 10.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(5 * pi/4), radius * sin(5 * pi/4)),
                child: Dot(
                  radius: 10.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(6 * pi/4), radius * sin(6 * pi/4)),
                child: Dot(
                  radius: 10.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(7 * pi/4), radius * sin(7 * pi/4)),
                child: Dot(
                  radius: 10.0,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius * cos(8 * pi/4), radius * sin(8 * pi/4)),
                child: Dot(
                  radius: 10.0,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class Dot extends StatelessWidget{
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.color
        ),
      ),
    );
  }
}