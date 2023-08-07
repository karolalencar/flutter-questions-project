import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onRestartQuiz;

  Result(this.score, this.onRestartQuiz, {super.key});

  String get resultPhrase {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Você é bom!';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: onRestartQuiz,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
