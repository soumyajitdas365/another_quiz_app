// ignore_for_file: prefer_const_constructors

import 'package:another_quiz/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      theme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      home: WelcomeScreen(),
    );
  }
}
