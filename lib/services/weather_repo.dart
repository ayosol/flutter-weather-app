import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/models/location.dart';

abstract class WeatherApiClient {
  Future<Forecast> getWeather(Location location);
  Future<Location> getLocationId(String city);
}
