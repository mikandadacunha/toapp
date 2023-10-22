import 'package:flutter/material.dart';
import 'package:toapp/app/modules/add_task/widggets/item_title_widgets.dart';
import 'package:toapp/app/modules/home/widgets/app_bar_widgets.dart';
import 'package:toapp/app/modules/home/widgets/title_widgets.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:toapp/app/shared/models/task_models.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  final _nameController = TextEditingController();
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidgets(),
      body: ListView(
          padding: const EdgeInsets.all(18.0),
          children : [
           
            const  TitleWidgets(text: 'Add a Task'), 
            const SizedBox(height: 40,
            ),
             _buildTitle(),
             const SizedBox(height: 50,
             ),
             _buildSelectHour(),
            const SizedBox(width: 17,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),

              ),
              onPressed: () {
              final item = TaskModels(
                title: _nameController.text, 
                time: '${date?.hour}:${date?.minute}', 
                isToday: true, 
                isFinished: false);
                Navigator.pop(context, item);
            },
              
            child: const Text('Add'),
            
            )
          
          ]
          ),
      
    );
  }
Widget _buildTitle(){
  return Row(
    children: [
      const ItemTitleWidgets(text: 'Name'),
      const SizedBox(width: 17,),

      Expanded(child: 
      TextField(controller: _nameController, 
      decoration: const InputDecoration(
      hintText: 'Write a new task', 
      hintStyle: TextStyle(fontSize: 12), 
      fillColor: Colors.grey
      
      ),
      
      )
      
      )
    ],
  );
}
Widget _buildSelectHour(){
  return  Row(
    children: [
      const ItemTitleWidgets(text: 'Hour'),
      const SizedBox(width: 17,
      
      ),
      Expanded(child: TimePicker()),
     
    ],
  );
}


Widget TimePicker() {
  return  TimePickerSpinner(
    is24HourMode: true,
    normalTextStyle: const TextStyle(
      fontSize: 16,
      color: Colors.grey
    ),
    highlightedTextStyle: const TextStyle(
      fontSize: 24,
      color: Colors.black
    ),
    spacing: 50,
    itemHeight: 80,
    isForce2Digits: true,
    onTimeChange: (time) {
      setState(() {
        date = time;
      });
    },
  );
}
}