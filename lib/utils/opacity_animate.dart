import 'package:flutter/material.dart';
import 'package:flutter_weather_app/views/homescreen.dart';
import 'package:get/get.dart';

class OpacityAnimate extends StatefulWidget {
  @override
  _OpacityAnimateState createState() => _OpacityAnimateState();
}

class _OpacityAnimateState extends State<OpacityAnimate> {
  Tween<double> tween = Tween(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 4),
        tween: tween,
        builder: (BuildContext context, double opacity, Widget child) {
          return Opacity(
            opacity: opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/climate_icon.png',
                  height: size.width * 0.26,
                ),
                Text("Weather Forecast")
              ],
            ),
          );
        },
        onEnd: () {
          Get.off(HomeScreen());
        },
      ),
    );
  }
}
