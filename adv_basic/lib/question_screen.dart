import 'package:adv_basic/answer_button.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 중심축 정렬을 할 수 있음
        children: [
          const Text(
            "The question...",
            style: TextStyle(
              color: Color.fromARGB(235, 255, 254, 254),
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            answerText: 'Answer 1...',
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          AnswerButton(
            answerText: 'Answer 2...',
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          AnswerButton(
            answerText: 'Answer 3...',
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          AnswerButton(
            answerText: 'Answer 4...',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
