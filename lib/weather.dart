import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';

import 'package:simple_weather_app/src/widgets/pages/search_page.dart';
import 'package:simple_weather_app/src/widgets/pages/loading_page.dart';
import 'package:simple_weather_app/src/widgets/pages/weather_page.dart';

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
        routes: {
          SearchPage.url: (_) => const SearchPage(),
          WeatherPage.url: (_) => const WeatherPage(),
          LoadingPage.url: (_) => const LoadingPage(),
        },
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF484B5B),
            colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.purple[900] ?? Colors.black12,
              onPrimary: Colors.white54,
              secondary: Colors.purple[500] ?? Colors.black38,
              onSecondary: Colors.white54,
              error: Colors.redAccent,
              onError: Colors.black54,
              background: const Color(0xFF484B5B),
              onBackground: Colors.white60,
              surface: const Color(0xFF484B5B),
              onSurface: Colors.white60,
            )),
        initialRoute: SearchPage.url,
      ),
    );
  }
}
