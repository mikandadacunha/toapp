import 'package:flutter/material.dart';

class ItemTitleWidgets extends StatelessWidget {
   const ItemTitleWidgets({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, 
                style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),);
  }
}