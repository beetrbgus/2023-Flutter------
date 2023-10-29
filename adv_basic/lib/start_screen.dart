import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/spring.png',
            width: 300,
          ),
          // Opacity(
          //   opacity: 0.8,
          //   child: Image.asset(
          //     'assets/images/spring.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Learn Flutter the fun way!!",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            label: const Text("Start Quiz"),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(
              Icons.quiz_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
