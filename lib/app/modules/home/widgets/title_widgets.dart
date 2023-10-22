import 'package:flutter/material.dart';

class TitleWidgets extends StatelessWidget {
  const TitleWidgets({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, 
                style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                
              ),);
  }
}