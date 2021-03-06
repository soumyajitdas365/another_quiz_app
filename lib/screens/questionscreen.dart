// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, sized_box_for_whitespace

import 'package:another_quiz/controller/controller.dart';
import 'package:another_quiz/konstants.dart';

import 'package:another_quiz/screens/questioncard.dart';
import 'package:another_quiz/timebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller _questioncontroller = Get.put(Controller());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: _questioncontroller.nextQuestion,
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/bg.svg",
              fit: BoxFit.fill,
            ),
            SafeArea(
                child: Container(
              height: 610,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: TimeBar(),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Obx(() => Text.rich(
                          TextSpan(
                            text:
                                "Question ${_questioncontroller.questionNumber.value}/",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: kSecondaryColor),
                            children: [
                              TextSpan(
                                text: "${_questioncontroller.questions.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: kSecondaryColor),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _questioncontroller.pageController,
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: _questioncontroller.updateQuestionNumber,
                      itemCount: _questioncontroller.questions.length,
                      itemBuilder: (context, index) => QuestionCard(
                        question: _questioncontroller.questions[index],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
