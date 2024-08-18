import 'package:get/get.dart';
import 'package:practice_app/sql%20pract/models/task_model.dart';
import 'package:practice_app/sql%20pract/services/db_helper.dart';

class TaskController extends GetxController {
  final dbHelper = DatabaseHelper.internal();
  final tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future fetchData() async {
    final taskList = await dbHelper.getTodo();
    tasks.value = taskList;
  }

  Future addTodo(String task) async {
    await dbHelper.addTodo(task);
    fetchData();
  }

  Future updateTodo(int id, int status) async {
    await dbHelper.updateTodo(id, status);
    fetchData();
  }
}
