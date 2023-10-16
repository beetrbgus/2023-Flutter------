import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientContainer(
        Color.fromRGBO(255, 171, 64, 1),
        Color.fromARGB(255, 235, 227, 217),
      ),
    ),
  ));
}
