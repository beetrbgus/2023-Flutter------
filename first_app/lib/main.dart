import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 235, 227, 217),
            Colors.orangeAccent
          ])),
          child: const Center(child: Text('Hello World'))),
    ),
  ));
}
