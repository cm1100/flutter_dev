import 'package:flutter/material.dart';
import 'package:dice_app/gradient_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientContainer(
        color1: Color.fromARGB(255, 154, 25, 100),
        color2: Color.fromARGB(255, 50, 21, 158),
      ),
    ),
  ));
}
