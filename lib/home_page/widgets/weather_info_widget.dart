import 'package:flutter/material.dart';
import 'package:weather_app/home_page/widgets/weather_details.dart';

class WeatherInfoWidget extends StatelessWidget {
  String sunriseValue;
  double windSpeedValue;
  WeatherInfoWidget({
    required this.sunriseValue,
    required this.windSpeedValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WeatherDetails(
            icon: Icons.wb_twilight_outlined,
            mainText: "Sunrise",
            value: sunriseValue),
        WeatherDetails(
            icon: Icons.air,
            mainText: "Wind Speed",
            value: "$windSpeedValue Km/hr"),
      ],
    );
  }
}
