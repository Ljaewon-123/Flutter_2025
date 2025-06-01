import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // 종료시 선언해야함 메모리에 남아있기 때문에 
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

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

  void _saveExpense() {
    final enteredAmount = double.tryParse(_amountController.text); // tryParse('hello') => null, tryParse('1.12') => 1.12
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) {
      if(Platform.isIOS) {
        // iOS에서는 showCupertinoDialog를 사용
        showCupertinoDialog(
          context: context, 
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text('Invalid Input'),
            content: const Text('Please make sure a valid title, amount, date and category was entered.'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        );
      }
      // show error message
      else{
        showDialog(
          context: context, 
          builder: (ctx) => AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text('Please make sure a valid title, amount, date and category was entered.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        );
      }
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    return Navigator.pop(context); // close the modal
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom; // 키보드가 올라오면 화면이 밀리는 현상 방지

    return LayoutBuilder(builder: (ctx, constants) {
      final width = constants.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if(width >= 600) 
                  Row(
                    children: [
                      TextField(
                        controller: _titleController,
                        maxLength: 50,
                        decoration: const InputDecoration(
                          label: Text('Title'),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: 
                        TextField(
                          controller: _amountController,
                          decoration: const InputDecoration(
                            prefixText: '\$',
                            label: Text('Amount'),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selectedDate == null 
                              ? 'No Date Chosen' 
                              : formatter.format(_selectedDate!),
                            ),
                          IconButton(onPressed: _presentDatePicker, icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ),
                        ).toList(), 
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // _titleController.clear();
                        // _amountController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed:_saveExpense,
                      child: const Text('Save Expense'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });

  }
}