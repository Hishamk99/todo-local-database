import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_with_hive_app/constant.dart';

import 'screens/home_page.dart';

void main() async {
  Hive.initFlutter;
  await Hive.openBox(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
