import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_hive_app/cubit/cubit/get_tasks_cubit.dart';
import 'package:todo_with_hive_app/widgets/dialog_box.dart';
import 'package:todo_with_hive_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tasksList = [];

  @override
  void initState() {
<<<<<<< HEAD
    tasksList = BlocProvider.of<GetTasksCubit>(context).loadDate();
    BlocProvider.of<GetTasksCubit>(context).updateData();
=======
    tasksList = BlocProvider.of<GetTasksCubit>(context).todoList;
>>>>>>> 7d364d3ea976f9d6f61bb42336af391572f7895c
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
              BlocProvider.of<GetTasksCubit>(context)
                  .addTask(task: [controller.text, false]);
              controller.clear();

              Navigator.pop(context);
              tasksList = BlocProvider.of<GetTasksCubit>(context).updateData();
            },
            onCancel: () {
              Navigator.pop(context);
              tasksList = BlocProvider.of<GetTasksCubit>(context).updateData();
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
        body: BlocBuilder<GetTasksCubit, GetTasksState>(
          builder: (context, state) {
            if (state is LoadTasksState) {
              tasksList = BlocProvider.of<GetTasksCubit>(context).todoList;
              return ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    textName: tasksList[index][0],
                    val: tasksList[index][1],
                    onChanged: (bool? val) {
                      tasksList[index][1] = !tasksList[index][1];
                      tasksList =
                          BlocProvider.of<GetTasksCubit>(context).updateData();
                    },
                    onPressed: (item) {
<<<<<<< HEAD
                      BlocProvider.of<GetTasksCubit>(context)
                          .removeTask(task: tasksList[index]);
=======
                      tasksList.remove(tasksList[index]);
>>>>>>> 7d364d3ea976f9d6f61bb42336af391572f7895c
                      tasksList =
                          BlocProvider.of<GetTasksCubit>(context).updateData();
                    },
                  );
                },
              );
            }
            return const Center(
              child: Text(
                'There is no tasks',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
