import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

main() {
  runApp(QuestionsApp());
}

class QuestionsApp extends StatefulWidget {
  @override
  State<QuestionsApp> createState() => _QuestionsAppState();
}

class _QuestionsAppState extends State<QuestionsApp> {
  var _questionSelected = 0;
  var _finalScore = 0;
  final _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 8},
        {'text': 'Verde', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Branco', 'score': 6},
      ],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Coelho', 'score': 8},
        {'text': 'Cobra', 'score': 4},
        {'text': 'Elefante', 'score': 7},
        {'text': 'Leão', 'score': 10},
      ],
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'answers': [
        {'text': 'Maria', 'score': 10},
        {'text': 'Leo', 'score': 8},
        {'text': 'João', 'score': 6},
        {'text': 'Pedro', 'score': 4},
      ],
    },
  ];

  void _answer(int score) {
    if (isQuestionSelected) {
      setState(() {
        _questionSelected++;
        _finalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _questionSelected = 0;
      _finalScore = 0;
    });
  }

  bool get isQuestionSelected {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: isQuestionSelected
            ? Quiz(
                questions: _questions,
                selectedQuestion: _questionSelected,
                answer: _answer)
            : Result(_finalScore, _restartQuiz),
      ),
    );
  }
}

/* irá gerar um pequeno problema dentro do Map e na Lista dentro do arquivo questionario.dart.

Para resolver é bem simples, basta adicionar o casting "as String” lá no map. Dessa forma:

...respostas
            .map((resp) => Resposta(resp['texto'] as String, quandoResponder))
            .toList(),
E na Lista fazer o cast para o mesmo tipo da Lista, dessa forma:

List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : []; */