import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                ),
                Expanded(child: Column(
                  children: [
                    Text(data['question'] as String),
                    const SizedBox(height: 5),
                    Text(data['user_answer'] as String),
                    Text(data['correct_answer'] as String),
                  ],
                ),),
              ],
            );
          }).toList()
        ),
      )
    );




    // -------------
    // return ListView.builder(
    //   itemCount: summaryData.length,
    //   itemBuilder: (context, index) {
    //     final questionData = summaryData[index];
    //     return ListTile(
    //       title: Text(questionData['question'] as String),
    //       subtitle: Text('Your answer: ${questionData['user_answer']}'),
    //       trailing: Text('Correct answer: ${questionData['correct_answer']}'),
    //     );
    //   },
    // );
  }
}