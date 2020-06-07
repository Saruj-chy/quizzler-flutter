import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';

void main() => runApp(Quizzler());

Quiz_Brain quiz_brain = Quiz_Brain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<bool> answers = [false, true, true];
  int questionNumber = 0;

  void Answer() {
    //TODO: Answer() is here
    if (questionNumber < quiz_brain.questionBank.length - 1) {
      questionNumber++;
      print(questionNumber - 1);
    } else {
      print(questionNumber);
      questionNumber = 0;
    }

    /*bool correctAnswer = answers[questionNumber];
    print(answer);
    if (correctAnswer == answer) {
      print('user pick right answer');
      print(answer);
      print(correctAnswer);
      setState(() {
        scorekeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      });
    } else {
      print('user pick wrong answer');
      setState(() {
        scorekeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
//                  scorekeeper.removeAt(0);
      });
    }*/
  }

  void checkAnswer(bool pickAnswer) {
    //TODO : CheckAnswer() is here
    bool correctAnswer = quiz_brain.questionAnswer(questionNumber);
    Answer();
    if (correctAnswer == pickAnswer) {
      print('user pick right answer');
      setState(() {
        scorekeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      });
    } else {
      print('user pick wrong answer');
      setState(() {
        scorekeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
//                  scorekeeper.removeAt(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
//                'This is where the question text will go.',
//                questions[questionNumber],
//                quiz_brain.questionBank[questionNumber].questionText,
                quiz_brain.questionText(questionNumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        //TODO: first text command
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                //TODO: Expanding true
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
//                Answer(true);
//                bool correctAnswer = quiz_brain.questionBank[questionNumber].questionAnswer;
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',

                //TODO:   Expanding false.
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
//                bool correctAnswer = quiz_brain.questionBank[questionNumber].questionAnswer;

                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
