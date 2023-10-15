import 'package:flutter/material.dart';

var title = 'Hello World -- !!!';

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 28,
      ),
      title,
    );
  }
}
