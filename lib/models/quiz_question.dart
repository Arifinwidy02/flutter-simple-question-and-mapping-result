class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffeled() {
    final shuffledAnwer = List.of(answer);
    shuffledAnwer.shuffle();
    return shuffledAnwer;
  }
}
