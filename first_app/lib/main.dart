import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: GradientContainer(const Color.fromRGBO(255, 171, 64, 1),
          const Color.fromARGB(255, 235, 227, 217)),
    ),
  ));
}
