import 'package:flutter/material.dart';
import 'package:flutter_weather_app/util/tween_animation.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpacityAnimate(),
    );
  }
}
