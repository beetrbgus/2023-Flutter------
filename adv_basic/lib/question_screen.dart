import 'package:adv_basic/answer_button.dart';
import 'package:flutter/material.dart';
import 'data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];

    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중심축 정렬을 할 수 있음
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Color.fromARGB(235, 255, 254, 254),
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...currentQuestion.getShuffleAnswers().map((answer) => AnswerButton(
                  answerText: answer,
                  onTap: () {},
                )),
          ],
        ),
      ),
    );
  }
}
