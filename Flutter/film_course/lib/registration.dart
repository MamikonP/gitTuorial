import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class RegistrationPage extends StatefulWidget {
  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage>{
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  
  File jsonFile;
  Directory directory;
  String fileName = "user.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  void initState() {
    super.initState();
    getAppDocDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Registration", textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Tahoma",
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.text_fields,
                    size: 50.0,
                    color: Color.fromRGBO(36, 217, 0, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      textAlign: TextAlign.left,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Username",
                        helperText: "Username can contain symbols [a-z/A-Z]",
                        helperStyle: TextStyle(color:Colors.yellow[100]),
                        fillColor: Colors.white,
                        filled: true
                      ),
                      controller: namecontroller,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:16.0, right: 16.0),
                    child: TextField(
                      textAlign: TextAlign.left,
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          helperText: "Password can contain 6 or more symbols",
                          helperStyle: TextStyle(color:Colors.yellow[100]),
                          filled: true,
                          fillColor: Colors.white
                      ),
                      controller: passwordcontroller,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        "Registration",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      onPressed: () => pressed(),
                      textColor: Colors.black,
                      color: Color.fromRGBO(36, 217, 0, 1),
                    ),
                  )
                ],
              )
          ),
        )
      ),
    );
  }

  void pressed() {
    if(namecontroller.text.contains(RegExp(r'[A-Z]')) || namecontroller.text.contains(RegExp(r'[a-z]'))
       && passwordcontroller.text.length > 6){
      writeToFile(namecontroller.text, passwordcontroller.text);
      namecontroller.clear();
      passwordcontroller.clear();
    }

  }

  void getAppDocDirectory() {
    getApplicationDocumentsDirectory().then((Directory dir){
      directory = dir;
      jsonFile = File(directory.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if(fileExists){
        this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
      }
    });
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName){
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, String value){
    Map <String, dynamic> content = {key : value};
    if(fileExists){
      print(directory.path);
      Map <String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
        print("File does not exist!");
        createFile(content, directory, fileName);
      }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
  }

}