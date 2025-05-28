class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  
  final String text;
  final List<String> answers;

  // get getShuffledAnswers {}
  List<String> get shuffledAnswers {
    final shuffled = List<String>.from(answers);
    shuffled.shuffle();
    return shuffled;
  }
}