import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/models/weather_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  final WeatherData weatherData;

  const Weather({Key key, @required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      weatherData.date.toString(),
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
                    Text(
                      weatherData.temp.toString(),
                      style: GoogleFonts.lato(
                        fontSize: 85,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'https://openweathermap.org/img/w/${weatherData.icon}.png',
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
          Text(weatherData.name),
          Text(
            weatherData.weatherType,
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
      ),
    );
  }
}
