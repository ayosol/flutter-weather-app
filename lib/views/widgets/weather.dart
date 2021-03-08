import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather_data.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  final WeatherData weatherData;

  const Weather({Key key, @required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weatherData.name),
        Text(
          weatherData.main,
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        Text('${weatherData.temp.toString()}\u00B0'),
        Image.network(
            'https://openweathermap.org/img/w/${weatherData.icon}.png'),
        Text(DateFormat.yMMMd().format(weatherData.date)),
        Text(DateFormat.Hm().format(weatherData.date)),
      ],
    );
  }
}
