import 'package:flutter/material.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidgets({super.key});



  final String perfilImg = '../img/Image2.jpeg';
  @override
  Widget build(BuildContext context) {

    return AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          actions: [CircleAvatar(
            backgroundColor: Colors.white,
          backgroundImage: AssetImage(perfilImg),),
          const SizedBox(width: 20,)
          
          ],
          
          );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}