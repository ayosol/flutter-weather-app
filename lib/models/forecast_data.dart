import 'package:flutter_weather_app/models/weather_data.dart';

class ForecastData {
  final List list;

  ForecastData({this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List list = new List();

    for (dynamic e in json['list']) {
      WeatherData w = new WeatherData(
        name: e['name'],
        date: new DateTime.fromMicrosecondsSinceEpoch(e['dt'] * 1000,
            isUtc: false),
        temp: e['main']['temp'].toDouble(),
        main: e['weather'][0]['main'],
        icon: e['weather'][0]['icon'],
      );
      list.add(w);
    }

    return ForecastData(
      list: list,
    );
  }
}
