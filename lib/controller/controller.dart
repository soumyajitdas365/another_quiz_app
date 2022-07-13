// ignore_for_file: unused_field, unnecessary_this, prefer_const_constructors, non_constant_identifier_names, prefer_final_fields

import 'package:another_quiz/models/questionsmodel.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;
  late Animation _animation;
  Animation get animation => this._animation;
  PageController? _pageController;
  PageController? get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            answer: question['answer_index'],
            options: question['options']),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAnswer;
  int get correctanswer => this._correctAnswer;

  late int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numberofCorrectAnswer = 0;
  int get numberofCorrectAnswer => this._numberofCorrectAnswer;

  @override
  void onInit() {
    _animationcontroller =
        AnimationController(duration: Duration(seconds: 20), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationcontroller)
      ..addListener(() {
        update();
      });
    _animationcontroller.forward().whenComplete(() => nextQuestion());
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _animationcontroller.dispose();
    _pageController?.dispose();
    super.onClose();
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController!
          .nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationcontroller.reset();
      _animationcontroller.forward().whenComplete(() => nextQuestion());
    }
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) _numberofCorrectAnswer++;
    _animationcontroller.stop();
    update();
    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
