import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_hive_app/constant.dart';
import 'package:todo_with_hive_app/data/todo_hive.dart';
import 'package:todo_with_hive_app/widgets/dialog_box.dart';
import 'package:todo_with_hive_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoHive data = TodoHive();
  final box = Hive.box(boxName);

  @override
  void initState() {
    if (box.get(keyList) == null) {
      data.createInitialData();
    } else {
      data.loadDate();
    }
    super.initState();
  }

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
              data.todoList.add(
                [controller.text, false],
              );
              Navigator.pop(context);
              setState(() {});
              data.updateData();
            },
            onCancel: () {
              Navigator.pop(context);
              data.updateData();
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
          itemCount: data.todoList.length,
          itemBuilder: (context, index) {
            return TodoItem(
              textName: data.todoList[index][0],
              val: data.todoList[index][1],
              onChanged: (bool? val) {
                data.todoList[index][1] = !data.todoList[index][1];
                setState(() {});
                data.updateData();
              },
              onPressed: (item) {
                data.todoList.remove(data.todoList[index]);
                setState(() {});
                data.updateData();
              },
            );
          },
        ),
      ),
    );
  }
}
