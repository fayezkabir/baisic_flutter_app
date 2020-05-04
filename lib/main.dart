import 'package:flutter/material.dart';
import 'package:helloflutter/result.dart';
import './quiz.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "what's your favourite color ? ",
      "answer": [
        {"text": "Black", "score": 10},
        {"text": " white", "score": 5},
        {"text": "aqua blue", "score": 2}
      ]
    },
    {
      "questionText": "what's  your favourtite animal ? ",
      "answer": [
        {"text": "dog", "score": 10},
        {"text": " tiger", "score": 8},
        {"text": "Lion", "score": 5}
      ]
    },
    {
      "questionText": "what's  your favourtite actress ? ",
      "answer": [
        {"text": "kat", "score": 10},
        {"text": " dip", "score": 6},
        {"text": "pri", "score": 8}
      ]
    }
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
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
    }
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
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : 
            Result(_totalScore, _resetQuiz)
            ,
      ),
    );
  }
}
