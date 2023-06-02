import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  final Function(Expense) deleteExpense;

  const ExpensesList(
      {super.key, required this.expenses, required this.deleteExpense});

  @override
  Widget build(BuildContext context) {
    // for lists of unclear length dont use column
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              margin: const EdgeInsets.all(16),
            ),
            key: ValueKey(key),
            child: ExpenseItem(expense: expenses[index]),
            onDismissed: (direction) {
              deleteExpense(expenses[index]);
            },
          );
        });
  }
}
