import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly_app/pages/Home.page.dart';

void main() async {
  await Hive.initFlutter("taskly_app/hive_boxes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskly',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}
