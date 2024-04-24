import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_hive_app/constant.dart';
import 'package:todo_with_hive_app/cubit/cubit/get_tasks_cubit.dart';

import 'screens/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTasksCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
