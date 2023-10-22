import 'package:flutter/material.dart';
import 'package:toapp/app/shared/models/task_models.dart';

class ItemLisWdigets extends StatefulWidget {
  const ItemLisWdigets({
  super.key, 
  required this.item,
  required this.chengeTask,
  required this.deleteTask

  
  }
  );

   //// Final variable item from TaskModels import
   final Function() deleteTask;
   final Function() chengeTask;
   final TaskModels item;


  @override
  State<ItemLisWdigets> createState() => _ItemLisWdigetsState();
}

class _ItemLisWdigetsState extends State<ItemLisWdigets> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing:
      IconButton(
      
      onPressed: () {
        widget.deleteTask();
      }, icon: 
      const Icon(Icons.delete),),
      
      leading: Checkbox( onChanged: (value){
      setState(() {
      widget.item.change(value!);
        
      });
      widget.chengeTask();
    },
    value: widget.item.isFinished),

    title: Text(widget.item.title, 
    style: const TextStyle(
      fontSize: 14, 
      color: Colors.black, 
      fontWeight: FontWeight.w600),),
    subtitle: Text(widget.item.time, 
    style: const TextStyle(
      fontSize: 12, 
      color: Colors.grey),),
  );
  }
}