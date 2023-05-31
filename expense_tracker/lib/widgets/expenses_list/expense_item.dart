import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Card(
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('Rs.${expense.amount.toStringAsFixed(2)} '),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryItems[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.fromattedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
