import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';

const Alignment topLeft = Alignment.topLeft;
const Alignment bottomRight = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent,
            Color.fromARGB(255, 235, 227, 217),
          ],
          begin: topLeft,
          end: bottomRight,
        ),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
