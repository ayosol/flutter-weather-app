import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/services/api/weather_api.dart';

class ForecastService {
  final WeatherApi weatherApi;
  ForecastService(this.weatherApi);

  Future<Forecast> getWeather(String city) async {
    final location = await weatherApi.getLocationId(city);
    return await weatherApi.getWeather(location);
  }
}
