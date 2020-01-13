import 'package:flutter/material.dart';
import 'stacked_icons.dart';
import 'home.dart';


class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xFF18D191)),
        title:Text("Login")
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StackIcons(),
            // Quick Bee
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:8.0, bottom: 80.0),
                  child: Text("Qucik Bee", style: TextStyle(fontSize: 30.0),),
                )
              ],
            ),
            // Text fields login
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            // Text field password
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            // Login or forgot
            Row(
              children: <Widget>[
                Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 5.0, bottom: 10.0, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomePage()
                          ));
                        },
                        child:Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF18D191),
                          ),
                          child: Text("Login", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                        )
                      ),
                    )
                ),
                Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 10.0, bottom: 10.0, top: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: Text("Forgot Password?", style: TextStyle(fontSize: 17.0, color: Color(0xFF18D191)),),
                      ),
                    )
                ),
              ],
            ),
            Expanded(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 18.0),
                    child: Text("Create a new account", style: TextStyle(fontSize: 17.0, color: Color(0xFF18D191), fontWeight: FontWeight.bold),),
                  )
                ],
              )
            )
          ]
        ),
      ),
    );
  }
}