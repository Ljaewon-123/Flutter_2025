import 'package:flutter/material.dart';
import 'package:dice/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;
// Alignment? startAlignment;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  // 생성자 기능 추가 
  const GradientContainer.purple({super.key})
      : colors = const [Colors.purple, Colors.deepPurple];

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors, //[Colors.blue, Colors.red],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child: Center(
            child: DiceRoller()
          ),
        );
  }
}

