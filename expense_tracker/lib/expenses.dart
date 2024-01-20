import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('차트'),
          Expanded(
            child: ExpensesList(
              expenses: _registerExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
