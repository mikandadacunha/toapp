import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:toapp/app/modules/app_widgets.dart';
import 'package:toapp/app/shared/models/task_models.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelsAdapter());///The register of my tasks
  await Hive.openBox<TaskModels>('tasks');
  runApp(const MyApp());
}
