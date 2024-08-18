import 'dart:async';
import 'dart:developer';
import 'package:path/path.dart';
import 'package:practice_app/sql%20pract/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  static Database? _db;

  final _controller = StreamController<List<TaskModel>>.broadcast();
  Stream<List<TaskModel>> get todoStream => _controller.stream;

  Future<Database> get dbClient async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mySql');
    var myPath = await openDatabase(path, onCreate: _onCreate, version: 1);
    return myPath;
  }

  final _tableName = "my_todos";

  _onCreate(Database db, int version) async {
    db.execute(
        'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, task TEXT,status INTEGER)');
  }

  void addTodosToStream() async {
    final stream = await getTodo();
    _controller.sink.add(stream);
  }

  void dispose() {
    _controller.close();
  }

  Future addTodo(String task) async {
    final db = await dbClient;
    try {
      var res = await db.insert(_tableName, {'task': task, 'status': 0});
      log('addTodo -->> $res');
      addTodosToStream();
      return res;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<TaskModel>> getTodo() async {
    final db = await dbClient;
    try {
      final res = await db.query(_tableName);
      log('getTodo -->> $res');
      final taskList = res.map((e) => TaskModel.fromJson(e)).toList();
      return taskList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future updateTodo(int id, int value) async {
    final db = await dbClient;
    final res = await db.update(_tableName, {"status": value},
        where: "id = ?", whereArgs: [id]);
    addTodosToStream();
    return res;
  }
}
