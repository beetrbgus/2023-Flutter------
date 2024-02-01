import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/modal_expense_add.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: "더미 제목1",
      amount: 10000,
      createdAt: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "더미 제목2",
      amount: 7000,
      createdAt: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "더미 제목3",
      amount: 8000,
      createdAt: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "더미 제목4",
      amount: 3000,
      createdAt: DateTime.now(),
      category: Category.work,
    ),
  ];
  void _openAddExpenseOverlay() {
    // 동적으로 새로운 UI 요소를 아래에서 출력
    showModalBottomSheet(
      isScrollControlled: true, // 모듈 오버레이가 사용 가능한 높이를 모두 차지
      context: context,
      builder: ((context) => ModalExpenseAdd(onAddExpense: _addExpense)),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("비용 삭제됨."),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("지출 비용을 찾을 수 없습니다. 추가해보세요!"),
    );

    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onRemoveExpense: (expense) => _removeExpense(expense),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter 비용 추적기!"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ], // 앱바에 있는 버튼
      ),
      body: Column(
        children: [
          Chart(
            expenses: _registerExpenses,
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
