import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForecastWidget extends StatelessWidget {
  double max_temperature;
  double min_temperature;
  String weather_code;
  String day;
  ForecastWidget({
    required this.max_temperature,
    required this.min_temperature,
    required this.weather_code,
    required this.day,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 150,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0xfff9f9f9),
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(1, 1))
          ]),
      child: Column(
        children: [
          Lottie.asset("assets/lottie/Weather-$weather_code.json"),
          const SizedBox(
            height: 5,
          ),
          Text(
            day,
            style: const TextStyle(color: Color(0xfff9f9f9)),
          ),
          Text("${max_temperature.round()}/${min_temperature.round()} °C",
              style: const TextStyle(color: Color(0xfff9f9f9))),
        ],
      ),
    );
  }
}
