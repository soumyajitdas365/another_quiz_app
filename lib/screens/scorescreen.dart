import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/bg.svg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(),
              Text("data"),
            ],
          ),
        ],
      ),
    );
  }
}
