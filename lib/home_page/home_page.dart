import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home_page/providers/weather_data_provider.dart';

import 'widgets/forecast_widget.dart';
import 'widgets/main_frame_widget.dart';
import 'widgets/weather_info_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = context.read<WeatherDataProvider>();

    var counter = 10;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      if (!provider.isLoading) {
        isLoading = false;
        setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isLoading)
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.fill)),
                child: Center(
                  child:
                      Lottie.asset("assets/lottie/Loading animation blue.json"),
                ),
              ),
            if (!isLoading)
              Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Consumer<WeatherDataProvider>(
                        builder: (context, value, child) {
                          return MainFrameWidget(
                              timeZone: value.currentWeather.timezone,
                              weatherCode: value.currentWeatherCode,
                              temperature: value.currentWeather.temperature,
                              max_temperature:
                                  value.currentWeather.max_temperature,
                              min_temperature:
                                  value.currentWeather.min_temperature);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Color(0xfff9f9f9),
                        thickness: 2,
                        indent: 90,
                        endIndent: 90,
                      ),
                      Consumer<WeatherDataProvider>(
                        builder: (context, value, child) {
                          return WeatherInfoWidget(
                              sunriseValue: value.sunrise,
                              windSpeedValue: value.currentWeather.wind_speed);
                        },
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Color(0xfff9f9f9),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "7"
                            " days "
                            "forecast",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xfff9f9f9)),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              final provider =
                                  context.read<WeatherDataProvider>();
                              provider.getDailyWeatherData();
                            },
                            child: Row(
                              children: const [
                                Text("Get Details",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xfff9f9f9))),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(Icons.arrow_circle_down_outlined,
                                    color: Color(0xfff9f9f9)),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Consumer<WeatherDataProvider>(
                        builder: (context, value, child) {
                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                              clipBehavior: Clip.none,
                              itemBuilder: (context, index) {
                                return ForecastWidget(
                                  max_temperature: value
                                      .WeeklyWeatherData[index]["max_temp"],
                                  min_temperature: value
                                      .WeeklyWeatherData[index]["min_temp"],
                                  weather_code: value.WeeklyWeatherData[index]
                                      ["weather_code"],
                                  day: value.WeeklyWeatherData[index]["day"],
                                );
                              },
                              itemCount: value.WeeklyWeatherData.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}
