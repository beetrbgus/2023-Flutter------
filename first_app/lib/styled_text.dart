import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.title, {super.key});
  final String title;
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
