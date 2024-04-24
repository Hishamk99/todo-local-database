import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_hive_app/constant.dart';

class TodoHive {
  List todoList = [];
  final box = Hive.box(boxName);

  void createInitialData() {
    todoList = [
      ['do exercize', false],
      ['play football', false],
    ];
  }

  void loadDate() {
    todoList = box.get(keyList);
  }

  void updateData() {
    box.put(keyList, todoList);
  }
}
