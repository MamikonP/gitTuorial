import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LoginPage(),
));

class LoginPage extends StatefulWidget {
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation delayAnimation;

 /* void _urlLauncher() async{
    const url = "https://www.facebook.com/";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not lunch $url";
    }
  }*/

  @override
  void initState() {
    super.initState();
    controller =
    new AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = new Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.3, 1.0, curve: Curves.fastOutSlowIn)));
    delayAnimation = new Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
    //machAnimation = new Tween()
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double height;
    double fontsize = 0.0;
    double dot = 0.0;
    print(MediaQuery.of(context).size);
    if (width <= 360 && MediaQuery.of(context).size.height <= 600){
      fontsize = 50;
      height = fontsize;
      dot = 170.0;
    } else if(width <= 360 && MediaQuery.of(context).size.height >= 600){
      fontsize = 60;
      height = fontsize;
      dot = 180.0;
    }else{
      fontsize = 90;
      height = fontsize;
      dot = 255.0;
    }
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              resizeToAvoidBottomPadding: false,
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: Container(
                            child: Stack(children: <Widget>[
                              Container(
                                  padding:EdgeInsets.fromLTRB(25.0, 30, 0.0, 0.0),
                                  child: Text("Hello",
                                      style: TextStyle(
                                          fontSize: fontsize,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Arial'))),
                              Container(
                                  padding:EdgeInsets.fromLTRB(25.0, 25 + height, 0.0, 0.0),
                                  child: Text("There",
                                      style: TextStyle(
                                          fontSize: fontsize,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Arial'))),
                              Container(
                                  padding:EdgeInsets.fromLTRB(dot, 25 + height, 0.0, 0.0),
                                  child: Text(".",
                                      style: TextStyle(
                                        fontSize: fontsize,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'monsetrract',
                                        color: Color.fromRGBO(36, 217, 0, 1),
                                      ))),
                            ]))),
                    Transform(
                        transform: Matrix4.translationValues(
                            delayAnimation.value * width, 0.0, 0.0),
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(bottom: height/2)),
                                  Text("Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          fontFamily: 'Arial')),
                                  Container(
                                    padding:
                                    EdgeInsets.fromLTRB(25.0, height/2, 25.0, 0.0),
                                    child: TextField(
                                      decoration:
                                      InputDecoration(hintText: "E-mail"),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        fontFamily: 'Arial',
                                      ),
                                      obscureText: false,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                    EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
                                    child: TextField(
                                        decoration:
                                        InputDecoration(hintText: "Password"),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                          fontFamily: 'Arial',
                                        ),
                                        obscureText: true),
                                  ),
                                  Container(
                                      alignment: Alignment(1.0, 0.0),
                                      padding:
                                      EdgeInsets.only(top: 20.0, right: 25.0),
                                      child: InkWell(
                                        onTap: () {
                                          print("Forgot");
                                        },
                                        child: Text("Forgot password",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Arial',
                                                color: Color.fromRGBO(36, 217, 0, 1))),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(25.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          ButtonTheme(
                                            height: 50.0,
                                            child: RaisedButton(
                                                onPressed: () {print("Login");},
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(18.0),
                                                    side: BorderSide(
                                                        color: Colors.white.withOpacity(0.0))),
                                                color:Color.fromRGBO(36, 217, 0, 1),
                                                child: Text(
                                                  "LOGIN",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                      fontFamily: 'Arial',
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                          Padding(padding:EdgeInsets.only(bottom:15.0)),
                                          ButtonTheme(
                                            height: 50.0,
                                            child: RaisedButton(
                                                onPressed: () {print("facebook");},
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(18),
                                                    side: BorderSide(
                                                        width: 1.5,
                                                        color: Colors.black.withOpacity(1.0))),
                                                color: Colors.white.withOpacity(1.0),
                                                child: Text(
                                                  "Log in with Facebook",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                      fontFamily: 'Arial',
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                          Padding(padding:EdgeInsets.only(bottom:height)),
                                          Container(
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget> [
                                                    Text("New to Spotify?", style:
                                                    TextStyle(
                                                        fontSize:15.0,
                                                        color:Colors.black,
                                                        fontFamily:'Arial')),
                                                    InkWell(
                                                        onTap:(){print("register");},
                                                        child:Text(" Register", style:
                                                        TextStyle(
                                                            fontWeight:FontWeight.bold,
                                                            fontSize:15.0,
                                                            fontFamily:'Arial',
                                                            color:Color.fromRGBO(36, 217, 0, 1)))
                                                    )
                                                  ]
                                              )
                                          )
                                        ],
                                      )),
                                ]))),
                  ]));
        });
  }
}