import 'package:flutter/material.dart';
import 'package:todo_with_hive_app/widgets/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TO DO'),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return const TodoItem();
          },
        ),
      ),
    );
  }
}
