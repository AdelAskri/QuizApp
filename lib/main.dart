import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (quizBrain.getAnswer() == userAnswer) {
        quizBrain.incrementRightAnswer();
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    });
  }

  void resetGame() {
    setState(() {
      int rightAnswers = quizBrain.getRightAnswer();
      int questionsLength = quizBrain.getQuestionsLength();
      quizBrain.resetQuestionNumber();
      scoreKeeper = [];
      Alert(
        context: context,
        type: AlertType.success,
        title: 'Quiz Completed!',
        desc: 'You got $rightAnswers/$questionsLength correct answers',
        buttons: [
          DialogButton(
            child: Text(
              'Great',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  quizBrain.getQuestion(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.green,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                if (quizBrain.isFinished()) {
                  resetGame();
                }
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.red,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
                if (quizBrain.isFinished()) {
                  resetGame();
                }
              },
              child: Text(
                'false',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }

  void testAlert(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Test"),
      content: Text("Done..!"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
