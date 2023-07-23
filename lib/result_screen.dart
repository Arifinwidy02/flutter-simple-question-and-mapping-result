import 'package:adv_basic/data/question.dart';
import 'package:adv_basic/quiz.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/question_summary/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chooseAnswer, required this.onRestart});

  final List<String> chooseAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': question[i].text,
          'correct_answer': question[i].answer[0],
          'user_answer': chooseAnswer[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numTotalQuestion = question.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your answer $numCorrectQuestion from $numTotalQuestion Question that correct!',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255)),
              label: const Text('Restart Quiz!',
                  style: TextStyle(color: Colors.white)),
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
      ),
    );
  }
}
