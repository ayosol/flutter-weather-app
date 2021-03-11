class WeatherData {
  final String name;
  final DateTime date;
  final double temp;
  final double pressure;
  final double humidity;
  final double windSpeed;
  final String main;
  final String icon;

  WeatherData({
    this.name,
    this.date,
    this.temp,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.main,
    this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'],
      date: new DateTime.fromMicrosecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      windSpeed: json['wind']['speed'],
      icon: json['weather'][0]['icon'],
      humidity: json['main']['humidity'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
    );
  }
}
