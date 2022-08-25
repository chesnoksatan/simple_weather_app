import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/home.dart';

import 'dart:io' show Platform;

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final ServiceController controller;

  @override
  Widget build(BuildContext context) {
    const Widget home = Home();
    final Widget child = Platform.isIOS
        ? const CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(brightness: Brightness.dark),
            home: home,
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            home: home,
          );

    return ChangeNotifierProvider.value(
      value: controller,
      child: Theme(
        data: ThemeData.dark(),
        child: child,
      ),
    );
  }
}
