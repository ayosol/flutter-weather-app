import 'package:flutter/material.dart';
import 'package:flutter_weather_app/viewmodels/city_entry_viewmodel.dart';
import 'package:flutter_weather_app/viewmodels/forecast_viewmodel.dart';
import 'package:flutter_weather_app/views/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CityEntryViewModel>(
        create: (_) => CityEntryViewModel()),
    ChangeNotifierProvider<ForecastViewModel>(
        create: (_) => ForecastViewModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Provider',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
