import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainFrameWidget extends StatelessWidget {
  String timeZone;
  String? weatherCode;
  double temperature;
  double max_temperature;
  double min_temperature;
  MainFrameWidget({
    required this.timeZone,
    required this.weatherCode,
    required this.temperature,
    required this.max_temperature,
    required this.min_temperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timeZone,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfffafafa),
                    fontFamily: "CrimsonText"),
              ),
            ],
          ),
        ),
        Lottie.asset("assets/lottie/Weather-$weatherCode.json", height: 200),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${temperature.round()} °C",
                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfffafafa)),
              ),
              Text(
                "${max_temperature.round()} / ${min_temperature.round()} °C",
                style: const TextStyle(fontSize: 18, color: Color(0xfff9f9f9)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
