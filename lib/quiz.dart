import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answer;

  const Quiz({
    required this.questions,
    required this.selectedQuestion,
    required this.answer,
    super.key,
  });

  bool get isQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        isQuestionSelected ? questions[selectedQuestion].cast()['answers'] : [];
    return Column(
      children: [
        Question(questions[selectedQuestion]['text'].toString()),
        ...answers.map((anws) {
          return Answer(
            anws['text'] as String,
            () => answer(int.parse(anws['score'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
