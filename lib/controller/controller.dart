// ignore_for_file: unused_field, unnecessary_this, prefer_const_constructors

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;
  late Animation _animation;
  Animation get animation => this._animation;

  @override
  void onInit() {
    _animationcontroller =
        AnimationController(duration: Duration(seconds: 20), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationcontroller)
      ..addListener(() {
        update();
      });
    _animationcontroller.forward();
    super.onInit();
  }
}
