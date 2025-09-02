class DailyWeather {
  List<dynamic> max_temperature_2m;
  List<dynamic> min_temperature_2m;
  List<dynamic> weather_code;
  int is_day = 0;

  DailyWeather(
      {required this.max_temperature_2m,
      required this.min_temperature_2m,
      required this.weather_code,
      required this.is_day});

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
        max_temperature_2m: json["daily"]["temperature_2m_max"],
        min_temperature_2m: json["daily"]["temperature_2m_min"],
        weather_code: json["daily"]["weather_code"],
        is_day: json["current"]["is_day"]);
  }
}
