import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen; // => 문자열이 훨씬 편한데....??
  // var activeScreen;
  // as StartScreen() or Widget activeScreen = const QuestionsScreen();

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers,);
      });
    }
  }

  // 생성시 한번만 실행 모두 사용가능 
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreent);
  }

  void switchScreent() {
    setState(() => activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer,));
  }

  @override
  Widget build(BuildContext context) {
    // Widget screenWidget = StartScreen(startQuiz)
    // 물론 if문도 가능
    // final screenInside = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreent)
    //     : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}