import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
    this.expense, {
    super.key,
  });

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    var format = NumberFormat("###,###,###,###");
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              children: [
                Text(
                  expense.title,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('￦ ${format.format(expense.amount)}'),

                    const Spacer(), // 남은 공간을 다 차지, 위의 amount는 왼쪽, Row는 오른쪽으로 밀어냄
                    Row(children: [
                      Icon(
                        categoryIconse[expense.category],
                      ), // 강의에서 나오는 enum을 맵으로 만드는 방식
                      // Icon(expense.category.icon), // 이 방법으로도 사용 가능
                      const SizedBox(
                        width: 8,
                      ),
                      Text(expense.formmattedCreatedAt),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
