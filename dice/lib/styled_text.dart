import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this._text, {super.key});

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Text(
              _text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            );
  }
}