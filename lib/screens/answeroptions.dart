// ignore_for_file: prefer_const_constructors, unused_element, body_might_complete_normally_nullable

import 'package:another_quiz/controller/controller.dart';
import 'package:another_quiz/konstants.dart';
import 'package:another_quiz/models/questionsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.text,
    required this.index,
    required this.onpressed,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
        init: Controller(),
        builder: (optioncontroller) {
          Color getColor() {
            if (optioncontroller.isAnswered) {
              if (index == optioncontroller.correctanswer) {
                return Color.fromARGB(255, 84, 238, 89);
              } else if (index == optioncontroller.selectedAnswer &&
                  optioncontroller.selectedAnswer !=
                      optioncontroller.correctanswer) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getIcon() {
            return getColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: onpressed,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Text(
                    "${index + 1} $text",
                    style: TextStyle(color: getColor(), fontSize: 18),
                  ),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                        color: getColor() == kGrayColor
                            ? Colors.transparent
                            : getColor(),
                        border: Border.all(color: getColor()),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: getColor() == kGrayColor
                          ? null
                          : Icon(
                              getIcon(),
                              size: 20,
                            )),
                ],
              ),
            ),
          );
        });
  }
}
