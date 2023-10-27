import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            child: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
