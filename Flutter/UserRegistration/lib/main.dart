import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  final TextEditingController controller = new TextEditingController();
  final TextEditingController controller2 = new TextEditingController();
  String login = "";
  String password = "";
  String errorPass;
  String errorLogin;
  String errorLogPass = "";

  void pressed() {
    setState(() {
      if (login.contains(new RegExp(r'[0-9]')) == true){
        errorLogin = "Invalid username";
        login = "";
      }
      else if( login.contains(new RegExp(r'[a-z]')) == true || login.contains(new RegExp(r'[A-Z]')) == true ){
        if (password.length <= 6) {
          errorPass = "Invalid password";
          password = "";
        }
        else{
          print(login + "-" + password);
          errorPass = null;
          errorLogin = null;
          errorLogPass = "";
          login = "";
          password = "";
        }
      }
      else {
        errorLogPass = "Invalid username or password";
        login = "";
        password = "";
      }
      controller.text = "";
      controller2.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: new Text("Registration", textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Tahoma",
            fontStyle: FontStyle.normal,
            fontSize: 25.0
          ),
        ),
        backgroundColor: Colors.blueGrey
      ),
      body: new Container(
        child: new Center(
          child: new SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.text_fields,
                    size: 50.0,
                    color: Colors.blueGrey,
                  ),
                  new Padding(padding: EdgeInsets.all(0.0)),
                  new Text(errorLogPass,
                    style: TextStyle(
                        color: Colors.red
                    ),
                  ),
                  new TextField(
                    textAlign: TextAlign.left,
                    maxLength: 20,
                    autofocus: false,
                    obscureText: false,
                    decoration: new InputDecoration(
                      hintText: "Username",
                      errorText: errorLogin,
                      helperText: "Username can contain symbols [a-z/A-Z]",
                    ),
                    onChanged: (String str){
                      setState(() {
                        login = str;
                      });
                    },
                    controller: controller,
                  ),
                  new TextField(
                    textAlign: TextAlign.left,
                    maxLength: 20,
                    autofocus: false,
                    obscureText: true,
                    decoration: new InputDecoration(
                        hintText: "Password",
                        errorText: errorPass,
                        helperText: "Password can contain 6 or more symbols",
                    ),
                    onChanged: (String pass){
                      setState(() {
                        password = pass;
                      });
                    },
                    controller: controller2,
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  new ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,

                    child: RaisedButton(
                      child: new Text(
                        "Registration",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      onPressed: pressed,
                      textColor: Colors.white,
                      color: Colors.blueGrey.withOpacity(0.8),
                    ),
                  )
                ],
              )
          ),
        )
      ),
    );
  }
}