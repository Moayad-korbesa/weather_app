class CurrentWeather {
  final String timezone;
  final double temperature;
  final int weather_code;
  final double wind_speed;
  final int is_day;
  final String sunrise;
  final double max_temperature;
  final double min_temperature;

  CurrentWeather(
      {required this.timezone,
      required this.temperature,
      required this.weather_code,
      required this.wind_speed,
      required this.is_day,
      required this.sunrise,
      required this.max_temperature,
      required this.min_temperature});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
        timezone: json["timezone"],
        temperature: json["current"]["temperature_2m"],
        weather_code: json["current"]["weather_code"],
        wind_speed: json["current"]["wind_speed_10m"],
        is_day: json["current"]["is_day"],
        sunrise: json["daily"]["sunrise"][0],
        max_temperature: json["daily"]["temperature_2m_max"][0],
        min_temperature: json["daily"]["temperature_2m_min"][0]);
  }
}
