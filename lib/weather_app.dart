import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/home.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final ServiceController controller;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const Home(),
      ),
    );
  }
}
