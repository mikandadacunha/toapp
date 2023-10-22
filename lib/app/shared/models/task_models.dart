import 'package:hive/hive.dart';

part 'task_models.g.dart';

@HiveType(typeId: 0)
class TaskModels extends HiveObject{
  @HiveField(0)
 late String title;
 @HiveField(1)
  late String time;
  @HiveField(2)
  late bool isToday;
  @HiveField(3, defaultValue: false)
  late bool isFinished;


  TaskModels({
      required this.title,
      required this.time,
      required this.isToday,
      required this.isFinished
      });

    void change (bool isFinish){
    isFinished = isFinish;
  }
}