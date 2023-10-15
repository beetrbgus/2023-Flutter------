import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Color.fromARGB(255, 235, 227, 217)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
              style: TextStyle(
                color: Colors.white70,
                fontSize: 28,
              ),
              'Hello World'),
        ),
      ),
    ),
  ));
}
