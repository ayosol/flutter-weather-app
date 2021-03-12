import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/models/forecast_data.dart';
import 'package:flutter_weather_app/models/weather_data.dart';
import 'package:flutter_weather_app/utils/string_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String bgImg;
  bool isLoading = true;
  WeatherData weatherData;
  ForecastData forecastData;

  static const API_KEY = 'ca2fc75d93296fd8a95aee4ea886026c';

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }

    if (position != null) {
      final lat = position.latitude;
      final lon = position.longitude;

      final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$API_KEY');

      final forecastResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$API_KEY');

      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData =
              new WeatherData.fromJson(jsonDecode(weatherResponse.body));
          forecastData =
              new ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
          bgImg = StringHelper.getBgImg(weatherData);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    var size = Get.mediaQuery.size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Menu Clicked!'),
              child: SvgPicture.asset(
                'assets/images/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            bgImg != null ? bgImg : 'assets/images/climate_icon.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black38),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Text(
                            weatherData.name,
                            style: GoogleFonts.lato(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            weatherData.date.toLocal().toString(),
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                weatherData.temp.toString() + "K",
                                style: GoogleFonts.lato(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/cloudy.svg',
                                width: 34,
                                height: 34,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                weatherData.weatherType,
                                style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 40),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Wind',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                weatherData.windSpeed.toString(),
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'km/h',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 50,
                                    color: Colors.white38,
                                  ),
                                  Container(
                                    height: 5,
                                    width: weatherData.windSpeed / 2,
                                    color: Colors.greenAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Pressure',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                weatherData.pressure.toString(),
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'hPa',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              /*Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: size.width * 0.3,
                                    color: Colors.white38,
                                  ),
                                  Container(
                                    height: 5,
                                    width: weatherData.pressure / 20,
                                    color: Colors.redAccent,
                                  ),
                                ],
                              ),*/
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Humidity',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                weatherData.humidity.toString(),
                                style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '%',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 50,
                                    color: Colors.white38,
                                  ),
                                  Container(
                                    height: 5,
                                    width: weatherData.humidity / 2,
                                    color: Colors.redAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
