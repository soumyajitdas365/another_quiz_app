// ignore_for_file: prefer_const_constructors

import 'package:another_quiz/controller/controller.dart';
import 'package:another_quiz/konstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TimeBar extends StatelessWidget {
  const TimeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.7),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GetBuilder<Controller>(
          init: Controller(),
          builder: (controller) {
            return Stack(children: [
              LayoutBuilder(
                builder: ((context, constraints) => Container(
                      width: constraints.maxWidth * controller.animation.value,
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.circular(50)),
                    )),
              ),
              Positioned.fill(
                  child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text("${(controller.animation.value * 20).round()}sec"),
                    Spacer(),
                    SvgPicture.asset("assets/images/clock.svg")
                  ],
                ),
              ))
            ]);
          }),
    );
  }
}
