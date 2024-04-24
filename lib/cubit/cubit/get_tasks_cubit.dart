import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_hive_app/constant.dart';
part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitial());

  List todoList = [];
  final box = Hive.box(boxName);

  loadDate() {
    todoList = box.get(keyList);

    emit(LoadTasksState());

    return todoList;
  }

  updateData() {
    box.put(keyList, todoList);
    if (todoList.isEmpty) {
      emit(NoTasksState());
    } else {
      emit(LoadTasksState());
    }
    return todoList;
  }

  addTask({required List task}) {
    todoList.add(task);

    emit(LoadTasksState());
    return todoList;
  }

  removeTask({required List task}) {
    todoList.remove(task);
    emit(LoadTasksState());
    return todoList;
  }
}
