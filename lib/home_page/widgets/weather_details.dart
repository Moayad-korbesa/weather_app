import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  IconData icon;
  String mainText;
  String value;
  WeatherDetails({
    required this.icon,
    required this.mainText,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xfff9f9f9),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              mainText,
              style: const TextStyle(fontSize: 16, color: Color(0xfff9f9f9)),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, color: Color(0xfff9f9f9)),
            ),
          ],
        ),
      ),
    );
  }
}
