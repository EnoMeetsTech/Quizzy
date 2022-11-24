import 'package:flutter/material.dart';
import 'package:quizzy/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzy());

class Quizzy extends StatelessWidget {
  const Quizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'QUIZZY',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50.0,
          color: Colors.black,
          alignment: Alignment.center,
          child: const Text(
            'EnoCodes',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        body: const SafeArea(
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
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'The End.',
          style: const AlertStyle(
            titleStyle: TextStyle(fontWeight: FontWeight.bold),
            descStyle: TextStyle(fontSize: 15.0),
          ),
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () => checkAnswer(true),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text('TRUE',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () => checkAnswer(false),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text('FALSE',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
