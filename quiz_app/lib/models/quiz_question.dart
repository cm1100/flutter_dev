class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final newList = List.of(answers);
    newList.shuffle();
    return newList;
  }
}
