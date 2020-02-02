import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String table_name = 'TableName';
final String column_name = 'name';
final String column_id = 'id';

class TaskModel{
  final String name;
  int id;

  TaskModel({this.name, this.id});

  Map<String, dynamic> toMap(){
    return {
      column_name : this.name
    };
  }
}

class TodoHelper{
  Database db;

  TodoHelper(){
    initDatabase();
  }

  Future<void> initDatabase() async{
    db = await openDatabase(
      join(await getDatabasesPath(), "database.db"),
      onCreate: (db, version){
        return db.execute('CREATE TABLE $table_name($column_id INTEGER PRIMARY KEY AUTOINCREMENT, $column_name TEXT)');
      },
      version: 1
    );
  }

  Future<void> insertTask(TaskModel taskModel) async{
    try{
      db.insert(table_name, taskModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }catch(_){
      print(_);
    }
  }

  Future<List<TaskModel>> getAllTask() async{
    final List<Map<String, dynamic>> tasks = await db.query(table_name);

    return List.generate(tasks.length, (i){
      return TaskModel(name: tasks[i][column_name], id: tasks[i][column_id]);
    });
  }
}