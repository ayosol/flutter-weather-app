import 'package:flutter_weather_app/models/weather_data.dart';

class StringHelper {
  static String bgImg;

  static String getBgImg(WeatherData weatherData) {
    if (weatherData.weatherType == 'Clouds') {
      bgImg = 'assets/images/cloudy.jpeg';
    } else if (weatherData.weatherType == 'Thunderstorm') {
      bgImg = 'assets/images/thunderstorm.png';
    } else if (weatherData.weatherType == 'Rain') {
      bgImg = 'assets/images/rainy.jpg';
    } else if (weatherData.weatherType == 'Snow') {
      bgImg = 'assets/images/rainy.jpg';
    } else if (weatherData.weatherType == 'Clear') {
      bgImg = 'assets/images/rainy.jpg';
    }
    return bgImg;
  }
}
