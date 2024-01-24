import 'dart:math';

import 'package:flutter/material.dart';

class ModalExpenseAdd extends StatefulWidget {
  const ModalExpenseAdd({super.key});

  @override
  State<StatefulWidget> createState() => _ModalExpenseAdd();
}

class _ModalExpenseAdd extends State<ModalExpenseAdd> {
  var _enteredTitle = '';

  // 제목이 입력될 때마다 실행 됨. String input값은 onChanged에서 제공
  void _saveTitleInput(String input) {
    _enteredTitle = input;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            onChanged: _saveTitleInput,
            decoration: const InputDecoration(
              label: Text("제목"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_enteredTitle);
                },
                child: const Text('비용 저장'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
