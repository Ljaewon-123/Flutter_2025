import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.onTab, {super.key});

  final String text;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTab, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 38, 1, 77),
        foregroundColor: Colors.white,
      ),
      child: Text(text, textAlign: TextAlign.center,),
    );
  }
}