import 'package:flutter/material.dart';
import 'package:dice/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: [Colors.blue, Colors.red]),
        //  GradientContainer.purple()
      ),
    ),
  );
}
