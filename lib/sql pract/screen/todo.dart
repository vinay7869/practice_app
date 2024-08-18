import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/sql%20pract/models/task_model.dart';
import 'package:practice_app/sql%20pract/services/db_helper.dart';
import 'package:practice_app/sql%20pract/services/task_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // final dbHelper = DatabaseHelper.internal();
  final _controller = Get.put(TaskController());
  String? task;

  // @override
  // void initState() {
  //   super.initState();
  //   dbHelper.addTodosToStream(); // Initialize the stream with current data
  // }

  // @override
  // void dispose() {
  //   dbHelper
  //       .dispose(); // Dispose the stream controller when the widget is disposed
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO-DO List"),
      ),
      body: Obx(() {
        if (_controller.tasks.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: _controller.tasks.length,
            itemBuilder: (context, index) {
              final todo = _controller.tasks[index];
              return ListTile(
                title: Text(todo.task!),
                trailing: Checkbox(
                    value: todo.status == 1,
                    onChanged: (val) {
                      _controller.updateTodo(todo.id!, val == true ? 1 : 0);
                      setState(() {});
                    }),
              );
            },
          );
        }
      }),

      // StreamBuilder<List<TaskModel>>(
      //   stream: dbHelper.todoStream,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (!snapshot.hasData) {
      //       return const Center(
      //         child: Text("NO DATA FOUND"),
      //       );
      //     }
      //     return ListView.builder(
      //       itemCount: snapshot.data?.length,
      //       itemBuilder: (context, index) {
      //         final todo = snapshot.data?[index];
      //         return ListTile(
      //           title: Text(todo!.task!),
      //           trailing: Checkbox(
      //               value: todo.status == 1,
      //               onChanged: (val) {
      //                 dbHelper.updateTodo(todo.id!, val == true ? 1 : 0);
      //                 setState(() {});
      //               }),
      //         );
      //       },
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Add a Task"),
                    TextField(
                      onChanged: (value) {
                        task = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _controller.addTodo(task!);
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: const Text('Add'))
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
