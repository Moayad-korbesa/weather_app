import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/home_page/models/daily_weather_model.dart';

import 'current_weather_model.dart';

class WeatherService {
  static const CURRENT_WEATHER_URL =
      "https://api.open-meteo.com/v1/forecast?timezone=auto&latitude=35&longitude=38&current=temperature_2m,weather_code,wind_speed_10m,is_day&daily=temperature_2m_max,temperature_2m_min,sunrise";
  static const DAILY_WEATHER_URL =
      "https://api.open-meteo.com/v1/forecast?timezone=auto&latitude=35&longitude=38&daily=weather_code,temperature_2m_max,temperature_2m_min&current=is_day";

  Future<CurrentWeather> getCurrentWeather() async {
    final response = await http.get(Uri.parse(CURRENT_WEATHER_URL));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CurrentWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<DailyWeather> getDailyWeather() async {
    final response = await http.get(Uri.parse(DAILY_WEATHER_URL));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return DailyWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
