import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

/*
void main() {
  runApp(MyApp());
}
*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// turn public to private class with underscore
class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Grey', 'score': 8},
        {'text': 'Green', 'score': 4},
        {'text': 'Red', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Spider', 'score': 10},
        {'text': 'Eagle', 'score': 8},
        {'text': 'Turtle', 'score': 4},
        {'text': 'Panda', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite city?',
      'answers': [
        {'text': 'Seattle', 'score': 10},
        {'text': 'New York City', 'score': 8},
        {'text': 'San Francisco', 'score': 4},
        {'text': 'Los Angeles', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favorite country?',
      'answers': [
        {'text': 'Brazil', 'score': 2},
        {'text': 'United States', 'score': 4},
        {'text': 'Japan', 'score': 8},
        {'text': 'Iraq', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
