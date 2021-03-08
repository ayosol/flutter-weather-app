import 'dart:convert';

import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/services/weather_repo.dart';
import 'package:http/http.dart' as http;

class WeatherApi extends WeatherApiClient {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const apiKey = "ca2fc75d93296fd8a95aee4ea886026c";
  http.Client httpClient;

  WeatherApi() {
    this.httpClient = new http.Client();
  }

  Future<Location> getLocationId(String city) async {
    final requestUrl = '$baseUrl/weather?q=$city&APPID=$apiKey';
    final response = await this.httpClient.get(Uri.encodeFull(requestUrl));

    if (response.statusCode != 200) {
      throw Exception(
          'error retrieving location for city $city: ${response.statusCode}');
    }

    return Location.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Forecast> getWeather(Location location) async {
    final requestUrl =
        '$baseUrl/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&APPID=$apiKey';
    final response = await this.httpClient.get(Uri.encodeFull(requestUrl));

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: ${response.statusCode}');
    }

    return Forecast.fromJson(jsonDecode(response.body));
  }
}
