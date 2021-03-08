import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utils/opacity_animate.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpacityAnimate(),
    );
  }
}
