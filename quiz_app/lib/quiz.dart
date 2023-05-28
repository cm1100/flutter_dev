import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  var activeScreen2 = 'start-screen';

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen2 = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen2 = 'quiz';
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen2 = 'quiz';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = StartScreen(switchScreen);
    if (activeScreen2 != 'start-screen') {
      screenwidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen2 == 'result-screen') {
      screenwidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 235, 203, 19),
              Color.fromARGB(255, 55, 48, 19)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
