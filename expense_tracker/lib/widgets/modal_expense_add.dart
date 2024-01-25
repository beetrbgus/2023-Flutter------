import 'dart:math';

import 'package:flutter/material.dart';

class ModalExpenseAdd extends StatefulWidget {
  const ModalExpenseAdd({super.key});

  @override
  State<StatefulWidget> createState() => _ModalExpenseAdd();
}

class _ModalExpenseAdd extends State<ModalExpenseAdd> {
  // 텍스트 필드에 값으로 전달되는 값을 저장하는 것을 알아서 해 줌.
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
  }

  //initState와 build와 비슷하다. StatefulWidget의 생명주기의 일부분이다.
  // Widget 과 state가 destroy 되면 자동으로 플러터에 의해 호출된다.
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  // 제목이 입력될 때마다 실행 됨. String input값은 onChanged에서 제공. 이 방법대신 Controller를 사용
  // void _saveTitleInput(String input) {
  //   _enteredTitle = input;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            // onChanged: _titleController, // TextController를 사용하기 때문에 필요없어짐.
            decoration: const InputDecoration(
              label: Text("제목"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '￦',
                    label: Text("비용"),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("사용일"),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(
                        Icons.date_range_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.cancel_presentation_outlined,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
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
