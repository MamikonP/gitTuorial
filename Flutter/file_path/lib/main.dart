import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MaterialApp(
  title: "Reading and Writing to Storage",
  home: Home(Storage()),
));

class Home extends StatefulWidget{
  final Storage storage;
  Home(this.storage);
  HomeState createState()=>HomeState();
}

class HomeState extends State<Home>{
  String state;
  TextEditingController controller = TextEditingController();
  Future<Directory> _appDocDir;

  @override
  void initState() {
    super.initState();
    widget.storage.readData().then((String value){
      setState(() {
        state = value;
      });
    });
  }

  Future<File> writeData() async{
    setState(() {
      state = controller.text;
      controller.text = '';
    });
    return widget.storage.writeData(state);
  }

  void getDirectoryPath(){
    setState(() {
      _appDocDir = getApplicationDocumentsDirectory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reading and Writing data"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("${state ?? "File is empty"}"),
            TextField(
              controller: controller,
            ),
            RaisedButton(
              child: Text("Write data"),
              onPressed: writeData,
            ),
            RaisedButton(
              child: Text("Get dir path"),
              onPressed: getDirectoryPath,
            ),
            FutureBuilder<Directory>(
              future: _appDocDir,
              builder: (BuildContext contec, AsyncSnapshot<Directory> snapshot){
                Text text = Text('');
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasError){
                    text = Text('Error: ${snapshot.error}');
                  }else if(snapshot.hasData){
                    text = Text('Path: ${snapshot.data.path}');
                  }else{
                    text = Text('Unavailable');
                  }
                }
                return Container(
                  child: text,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Storage{
  // get file path in android or iOS
  Future<String> get localPath async{
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
  // get file
  Future<File> get localFile async{
    final path = await localPath;
    return File("$path/db.txt");
  }

  Future<String> readData() async{
    try{
      final file = await localFile;
      String body = await file.readAsString();
      return body;
    }catch(e){
      return e.toString();
    }
  }
  
  Future<File> writeData(String data) async{
    final file = await localFile;
    return file.writeAsString("$data");
  }
}
