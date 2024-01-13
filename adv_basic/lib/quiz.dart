import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/question_screen.dart';
import 'package:adv_basic/result_screen.dart';
import 'package:adv_basic/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers.clear();
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenwidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      screenwidget = ResultScreen(chosenAnswer: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 218, 152, 31),
                Color.fromARGB(255, 238, 206, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenwidget,
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
