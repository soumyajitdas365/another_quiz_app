// ignore_for_file: prefer_const_constructor, unused_local_variable, prefer_const_constructors

import 'package:another_quiz/konstants.dart';
import 'package:another_quiz/screens/questionscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/bg.svg",
            fit: BoxFit.fill,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  "Let's Play",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    hintText: "Full Name",
                    fillColor: Color.fromARGB(208, 22, 27, 72),
                    filled: true,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Get.to(QuestionScreen()),
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.9,
                    padding:
                        EdgeInsets.symmetric(horizontal: 105, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      gradient: kPrimaryGradient,
                    ),
                    child: Text("Let's Start Quiz"),
                  ),
                ),
                Spacer(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
