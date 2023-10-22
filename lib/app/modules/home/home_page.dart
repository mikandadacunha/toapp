import 'package:flutter/material.dart';
import 'package:toapp/app/modules/home/widgets/app_bar_widgets.dart';
import 'package:toapp/app/modules/home/widgets/item_list_widgets.dart';
import 'package:toapp/app/modules/home/widgets/title_widgets.dart';
import 'package:toapp/app/shared/models/task_models.dart';
import 'package:toapp/app/shared/repository/task_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// THe list of task of my aplication
List<TaskModels> allTask = [ ];

bool isLoading = false;

///The getter of all my tasks that are registrad in my aplication
void getAllTasks() async{
  setState(() {
    isLoading = true;
  });
  final taskRepository = TaskRepository();
  final tasks = await taskRepository.getAll();
  setState(() {
  allTask = tasks;
  isLoading = false;
    
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTasks();
  }
  ////Build of my aplication
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      ////Botton of my savement aplication, where every task are saved to database
      floatingActionButton: 
      FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 13, 13, 13),
        child: const Icon(Icons.add), 
        ///The botton that save every task in my aplication
        onPressed: () async {
         final result = await Navigator.pushNamed(context, '/add-task');
         if (result != null){
          await TaskRepository.addNewTask(result as TaskModels);
          getAllTasks();
         }
        },
        
        ),
      //The boddy of my aplication
      backgroundColor: Colors.white,
        appBar: const AppBarWidgets(),
        body: Padding(
          padding:  const EdgeInsets.all(18.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const TitleWidgets(text: 'Today'),
             _builTaskList(),
            ],
          ),
        ),
    );
  }

/// The builder of my app list and here's the water
Widget _builTaskList (){
  if(isLoading){
    return const CircularProgressIndicator();
  } /// Progress indicator bar

  if(allTask.isEmpty){
   return const Center (
      child:       
       Text('Sem atividades recentes'),
      
      );
  }
  /// My app list view responsable
  return Expanded(
    child: ListView.builder(
      itemBuilder: (context, index) => ItemLisWdigets(item: allTask[index],
      chengeTask: ()async {
       await TaskRepository.chengeTheTask(index, allTask[index]);
       getAllTasks();
      },
       deleteTask: () async {
         await TaskRepository.deleteTask(allTask[index]);
         getAllTasks();
       },
      ),
     
      itemCount: allTask.length,
      )
  );
}

}