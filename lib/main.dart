import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<Question> questions = [
    Question("Who let the dogs out.", true),
    Question("Dart is similar to C#", true),
    Question("Dart is an OOP focused language", true),
    Question("Xamarin is better than Flutter", false),
    Question("Dart Maps are dynamic by default", true),
    Question("Bolo is a china-men", true),
    Question("Solo is a china-man", false),
    Question("Dolo is a china-wo-man", false),
  ];

  int questionNumber = 0;

  void checkAnswer(bool state) {
    Icon icon;
    if (questions[questionNumber].answer == state) {
      icon = const Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      icon = const Icon(
        Icons.close,
        color: Colors.red,
      );
    }
    scoreKeeper.add(icon);

    if (questionNumber == questions.length - 1) {
      scoreKeeper.clear();
      return;
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
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber].text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                  questionNumber != questions.length - 1
                      ? questionNumber++
                      : questionNumber = 0;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                  questionNumber != questions.length - 1
                      ? questionNumber++
                      : questionNumber = 0;
                });
              },
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
