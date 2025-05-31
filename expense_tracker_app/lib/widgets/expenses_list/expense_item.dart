import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense; 

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: ListTile(
          title: Text(expense.title, style: Theme.of(context).textTheme.titleLarge,),
          subtitle: Row(
            children: [
              Icon(categoryIcons[expense.category],),
              const SizedBox(width: 8,),
              Text(expense.formattedDate)
            ],
          ),
          trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}