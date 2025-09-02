import 'package:flutter/material.dart';

import 'package:weather_app/home_page/models/current_weather_model.dart';
import 'package:weather_app/home_page/models/daily_weather_model.dart';
import 'package:weather_app/home_page/models/weather_service.dart';

class WeatherDataProvider extends ChangeNotifier {
  final _weatherService = WeatherService();

  late DailyWeather dailyWeather;
  late CurrentWeather currentWeather;

  late String sunrise;
  late String? currentWeatherCode;
  bool isLoading = true;
  bool weeklyDataLoaded = false;
  List<dynamic> WeeklyWeatherData = [];
  List<String> thisWeek = [];

  final List<dynamic> daysDectionary = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  // Decode Api Data
  String? decodeWeatherCode(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return currentWeather.is_day == 1 ? "sunny" : "night";
      case 1:
      case 2:
      case 3:
        return currentWeather.is_day == 1 ? "partly cloudy" : "cloudy(night)";
      case 45:
      case 48:
        return "windy";
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
        return currentWeather.is_day == 1 ? "partly shower" : "rainy(night)";
      case 71:
      case 73:
      case 75:
      case 77:
      case 80:
      case 81:
      case 82:
      case 85:
      case 86:
        return "snow";
    }
  }

  void dayOfTheWeek() {
    var date = DateTime.now();
    int t = 5;
    int tempCounter = 0;
    for (int i = 0; i < 7; i++) {
      if (date.day - 1 + i < 7) {
        thisWeek.add(daysDectionary[date.day - 1 + i]);
      } else {
        thisWeek.add(daysDectionary[tempCounter]);
        tempCounter++;
      }
    }
    tempCounter = 0;
  }

  Future<void> getDailyWeatherData() async {
    if (weeklyDataLoaded) return;
    dailyWeather = await _weatherService.getDailyWeather();
    dayOfTheWeek();
    for (int i = 0; i < dailyWeather.weather_code.length; i++) {
      WeeklyWeatherData.add({
        "max_temp": dailyWeather.max_temperature_2m[i],
        "min_temp": dailyWeather.min_temperature_2m[i],
        "weather_code": decodeWeatherCode(dailyWeather.weather_code[i]),
        "day": thisWeek[i]
      });
      weeklyDataLoaded = true;
      notifyListeners();
    }
  }

  Future<void> getCurrentWeatherData() async {
    currentWeather = await _weatherService.getCurrentWeather();
    sunrise = currentWeather.sunrise.substring(
        currentWeather.sunrise.indexOf("T") + 1, currentWeather.sunrise.length);
    currentWeatherCode = decodeWeatherCode(currentWeather.weather_code);
    isLoading = false;
    notifyListeners();
  }

  WeatherDataProvider() {
    getCurrentWeatherData();
  }
}
