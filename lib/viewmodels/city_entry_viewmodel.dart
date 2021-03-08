import 'package:flutter/material.dart';
import 'package:flutter_weather_app/viewmodels/forecast_viewmodel.dart';
import 'package:provider/provider.dart';

class CityEntryViewModel with ChangeNotifier {
  String _city;

  CityEntryViewModel();

  String get city => _city;

  void refreshWeather(String newCity, BuildContext context) {
    Provider.of<ForecastViewModel>(context, listen: false)
        .getLatestWeather(_city);

    notifyListeners();
  }

  void updateCity(String newCity) {
    _city = newCity;
  }
}
