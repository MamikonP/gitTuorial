import 'package:flutter/material.dart';
import 'database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controller = TextEditingController();
  List<TaskModel> tasks = [];
  TaskModel currentTask;

  @override
  Widget build(BuildContext context) {
    final TodoHelper _todoHelper = TodoHelper();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: controller,
              ),
            ),
            FlatButton(
              child: Text('Insert'),
              color: Colors.blueAccent,
              onPressed: (){
                currentTask = TaskModel(name: controller.text);
                _todoHelper.insertTask(currentTask);
                controller.text = '';
              },
            ),
            FlatButton(
              child: Text('Show All Task'),
              color: Colors.redAccent,
              onPressed: () async{
                List<TaskModel> list = await _todoHelper.getAllTask();
                setState(() {
                  tasks = list;
                });
              },
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: Text("${tasks[index].id}"),
                      title: Text("${tasks[index].name}"),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: tasks.length
              ),
            )
          ],
        )
      ),
    );
  }
}
