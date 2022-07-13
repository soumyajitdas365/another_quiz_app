// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:another_quiz/controller/controller.dart';
import 'package:another_quiz/konstants.dart';

import 'package:another_quiz/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller _controller = Get.put(Controller());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/images/bg.svg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_controller.numberofCorrectAnswer * 10}/${_controller.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(
                flex: 3,
              ),
              GestureDetector(
                onTap: () => Get.to(WelcomeScreen()),
                child: Container(
                  height: 50,
                  width: 180,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    gradient: kPrimaryGradient,
                  ),
                  child: Text("Try Again?"),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
