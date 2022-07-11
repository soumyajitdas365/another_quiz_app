// ignore_for_file: prefer_const_constructors

import 'package:another_quiz/controller/controller.dart';
import 'package:another_quiz/konstants.dart';
import 'package:another_quiz/models/questionsmodel.dart';
import 'package:another_quiz/screens/answeroptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);
  final Question question;
  @override
  Widget build(BuildContext context) {
    Controller _controller = Get.put(Controller());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.white),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black),
          ),
          ...List.generate(
            question.options.length,
            (index) => Options(
              text: question.options[index],
              index: index,
              onpressed: () => _controller.checkAnswer(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
