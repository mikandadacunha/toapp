
import 'package:flutter/material.dart';
import 'package:toapp/app/modules/add_task/add_tak_page.dart';
import 'package:toapp/app/modules/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      routes: {
        "/":(context) => const HomePage(),
        "/add-task":(context) => const AddTaskPage()
      },
    );
  }
}