import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/home_page/home_page.dart';
import 'package:weather_app/home_page/providers/weather_data_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherDataProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(fontFamily: "CrimsonText"),
      home: const HomePage(),
    );
  }
}
