import 'package:flutter/material.dart';
import 'package:todo_with_hive_app/widgets/dialog_box.dart';
import 'package:todo_with_hive_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ['solve problem', false],
    ['play piano', true],
    ['play football', false],
  ];

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    createNewTask() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: () {
              todoList.add([controller.text, false]);
              Navigator.pop(context);
              setState(() {});
            },
            onCancel: () {
              Navigator.pop(context);
            },
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow.shade100,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TO DO'),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoItem(
              textName: todoList[index][0],
              val: todoList[index][1],
              onChanged: (bool? val) {
                todoList[index][1] = !todoList[index][1];
                setState(() {});
              },
              onPressed: (item) {
                todoList.remove(todoList[index]);
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}
