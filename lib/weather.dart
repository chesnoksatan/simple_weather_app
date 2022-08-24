import 'package:flutter/material.dart';

import 'package:simple_weather_app/src/widgets/pages/search_page.dart';
import 'package:simple_weather_app/src/widgets/pages/weather_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SearchPage.url: (_) => const SearchPage(),
        WeatherPage.url: (_) => const WeatherPage(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple[900],
        backgroundColor: const Color(0xFF484B5B),
      ),
      initialRoute: SearchPage.url,
    );
  }
}
