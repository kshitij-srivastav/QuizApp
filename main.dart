import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
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
      'questionText': 'What\'s your favorite color?',
      'answers': [{'text':'Black','score':10},{'text': 'Red','score':5},{'text': 'Green','score':3}, {'text':'White','score':1},],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [{'text':'Rabbit','score':10}, {'text':'Snake','score':5}, {'text':'Elephant','score':3}, {'text':'Lion','score':1}],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [{'text':'Max','score':10}, {'text':'Max','score':10}, {'text':'Max','score':10}, {'text':'Max','score':10}],
    },
  ];
  var _questionIndex = 0;
  var _totalscore=0;
  void _resetquiz(){
    setState(() {
      _questionIndex=0;
    _totalscore=0;
    });
    
  }

  void _answerQuestion(int score) {
    _totalscore=_totalscore+score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
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
            : Result(_totalscore,_resetquiz),
      ),
    );
  }
}
