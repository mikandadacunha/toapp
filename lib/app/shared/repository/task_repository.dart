import 'package:hive/hive.dart';
import 'package:toapp/app/shared/models/task_models.dart';

class TaskRepository{

  /// adding new
 static Future <void> addNewTask(TaskModels task) async {
    final box = Hive.box<TaskModels>('tasks');
   await box.add(task);
  }

///Function that get all my tasks in the aplication
 Future <List<TaskModels>> getAll() async {
  await Future.delayed(const Duration(seconds: 3));
    final box = Hive.box<TaskModels>('tasks');
    final values = box.values.toList();

    return values;
  }
/// changing existente tasks
  static Future <void> chengeTheTask(int position, TaskModels task) async{
    final box = Hive.box<TaskModels>('tasks');
    await box.put(position, task);

  }
///Deleting old or done task
  static Future <void> deleteTask(TaskModels task) async{
    await task.delete();
}
}