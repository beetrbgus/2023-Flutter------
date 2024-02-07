import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateformatter = DateFormat("yyyy-MM-dd");

class ModalExpenseAdd extends StatefulWidget {
  const ModalExpenseAdd({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() => _ModalExpenseAdd();
}

class _ModalExpenseAdd extends State<ModalExpenseAdd> {
  // 텍스트 필드에 값으로 전달되는 값을 저장하는 것을 알아서 해 줌.
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final inputAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = inputAmount == null || inputAmount < 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error Message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("유효하지 않은 입력값이 있습니다."),
          content: const Text('입력값을 다시 한번 확인한 후 제출해주세요.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("확인!"),
            )
          ],
        ),
      );

      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: inputAmount,
        createdAt: _selectedDate!,
        category: _selectedCategory!,
      ),
    );
    Navigator.pop(context);
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
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
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
                        Text(
                          _selectedDate == null
                              ? "사용일 선택"
                              : dateformatter.format(_selectedDate!),
                        ),
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
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory, // 선택된 값이 보여짐. items 안에서 선택하는 것
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: [
                                Icon(categoryIconse[category]),
                                Text(category.name),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
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
                      _submitExpenseData();
                    },
                    child: const Text('비용 저장'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
