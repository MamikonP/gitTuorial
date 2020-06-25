import 'package:film_course/home.dart';
import 'package:film_course/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.black,
    canvasColor: Colors.black,
  ),
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
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File jsonFile;
  Directory directory;
  String fileName = "user.json";
  bool fileExists = false;
  Map<String, dynamic> content;

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
    controller.forward();
    getAppDocDirectory();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void getAppDocDirectory() {
    getApplicationDocumentsDirectory().then((Directory dir){
      directory = dir;
      jsonFile = File(directory.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if(fileExists){
        this.setState(() => content = json.decode(jsonFile.readAsStringSync()));
      }
    });
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
            backgroundColor: Colors.black,
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
                                          color: Colors.white,
                                          fontSize: fontsize,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Arial'))),
                              Container(
                                  padding:EdgeInsets.fromLTRB(25.0, 25 + height, 0.0, 0.0),
                                  child: Text("There",
                                      style: TextStyle(
                                        color: Colors.white,
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
                            ]))
                    ),
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
                                        color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          fontFamily: 'Arial')),
                                  Container(
                                    padding:
                                    EdgeInsets.fromLTRB(25.0, height/2, 25.0, 0.0),
                                    child: TextField(
                                      controller: fullNameController,
                                      decoration: InputDecoration(hintText: "Username", hintStyle: TextStyle(color: Colors.grey),
                                        filled: true,
                                        fillColor: Colors.white
                                      ),
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
                                      controller: passwordController,
                                        decoration:
                                        InputDecoration(hintText: "Password", hintStyle: TextStyle(color: Colors.grey), fillColor: Colors.white, filled: true),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                          fontFamily: 'Arial',
                                        ),
                                        obscureText: true),
                                  ),
                                  
                                  Container(
                                      padding: EdgeInsets.all(25.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          ButtonTheme(
                                            height: 50.0,
                                            child: RaisedButton(
                                                onPressed: () {
                                                  if(fullNameController.text.length > 0 && content.containsKey(fullNameController.text) && content[fullNameController.text] == passwordController.text){
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context){
                                                        return AlertDialog(
                                                          backgroundColor: Colors.black.withOpacity(0.9),
                                                          title:Text("WELCOME", style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),),
                                                          content: Text("${fullNameController.text} enjoy films", style: TextStyle(color:Colors.white),),
                                                          actions: <Widget>[
                                                            IconButton(
                                                              icon: Icon(Icons.done, color: Colors.lightGreenAccent,),
                                                              onPressed: (){
                                                                fullNameController.clear();
                                                                passwordController.clear();
                                                                Navigator.pop(context);
                                                                Navigator.pushReplacement(context, MaterialPageRoute(
                                                                  builder: (context) => HomePage()
                                                                ));
                                                              },
                                                            )
                                                          ],
                                                        );
                                                      }
                                                    );
                                                  } else {
                                                    showDialog(
                                                    context: context,
                                                    builder: (BuildContext context){
                                                      return AlertDialog(
                                                        backgroundColor: Colors.black.withOpacity(0.9),
                                                        title:Row(
                                                          children: <Widget>[
                                                            Icon(Icons.warning, color:Colors.yellowAccent),
                                                            Text("WARNING", style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),),
                                                          ],
                                                        ),
                                                        content: Text("Name or Password is not valid", style: TextStyle(color:Colors.white),),
                                                        actions: <Widget>[
                                                          IconButton(
                                                            icon: Icon(Icons.done, color: Colors.lightGreenAccent,),
                                                            onPressed: (){
                                                              Navigator.pop(context);
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    });
                                                  }
                                                },
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
                                                onPressed: () {
                                                  SystemNavigator.pop();
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(18),
                                                    side: BorderSide(
                                                        width: 1.5,
                                                        color: Colors.white.withOpacity(1.0))),
                                                color: Colors.white.withOpacity(1.0),
                                                child: Text(
                                                  "Exit",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                      fontFamily: 'Arial',
                                                      color: Colors.black),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                           
                                        ],
                                      )),
                                ]))),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget> [
                                              Text("New to Film-Zona?", style:
                                              TextStyle(
                                                  fontSize:15.0,
                                                  color:Colors.white,
                                                  fontFamily:'Arial')),
                                              InkWell(
                                                  onTap:(){
                                                    Navigator.push(context, MaterialPageRoute(
                                                      builder: (context) => RegistrationPage()
                                                    ));
                                                  },
                                                  child:Text(" Register", style:
                                                  TextStyle(
                                                      fontWeight:FontWeight.bold,
                                                      fontSize:15.0,
                                                      fontFamily:'Arial',
                                                      color:Color.fromRGBO(36, 217, 0, 1)))
                                              )
                                            ]
                                        )
                                    ),
                                  )
                  ]));
        });
  }
}