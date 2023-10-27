import 'package:adv_basic/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer.orange(),
        backgroundColor: Colors.deepOrange,
      ),
    ),
  );
}
