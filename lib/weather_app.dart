import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/home.dart';
import 'package:simple_weather_app/src/widgets/pages/welcome_page/welcome_page.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({
    required this.controller,
    required this.preferences,
    Key? key,
  }) : super(key: key);

  final ServiceController controller;
  final SharedPreferences preferences;

  @override
  State<StatefulWidget> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  bool _isWelcomePageShowed = false;

  @override
  void initState() {
    _isWelcomePageShowed =
        widget.preferences.getBool('isWelcomePageShowed') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
              ),
            ),
            child: _isWelcomePageShowed
                ? const Home()
                : WelcomePage(onExit: _onShowWelcomePage),
          ),
        ),
      ),
    );
  }

  void _onShowWelcomePage() {
    widget.preferences.setBool('isWelcomePageShowed', true);
    setState(() {
      _isWelcomePageShowed = true;
    });
  }
}
