import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 500, 
                  height: 300,
                  color: Colors.white.withValues(alpha: 127),
                ),
                const SizedBox(height: 50),
                Text(
                  'Learn Flutter the fun way!',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () {
                    startQuiz();
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  icon: const Icon(Icons.arrow_forward, size: 24),
                  label: const Text(
                    'Start Quiz',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          );
  }
}