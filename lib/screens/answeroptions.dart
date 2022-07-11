// ignore_for_file: prefer_const_constructors

import 'package:another_quiz/konstants.dart';
import 'package:flutter/material.dart';

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
              style: TextStyle(color: Colors.grey[600], fontSize: 18),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.done,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
