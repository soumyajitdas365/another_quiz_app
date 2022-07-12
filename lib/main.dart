// ignore_for_file: prefer_const_constructors

import 'package:another_quiz/screens/questionscreen.dart';
import 'package:another_quiz/screens/scorescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      home: ScoreScreen(),
    );
  }
}
