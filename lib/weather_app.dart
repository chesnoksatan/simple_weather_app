import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/pages/main_page.dart';
import 'package:simple_weather_app/src/widgets/pages/search_page.dart';
import 'package:simple_weather_app/src/widgets/pages/welcome_page/welcome_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    required this.controller,
    required this.preferences,
    Key? key,
  }) : super(key: key);

  final ServiceController controller;
  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF484B5B),
        ),
        routes: {
          WelcomePage.routeName: (context) =>
              WelcomePage(onExit: () => _onShowWelcomePage(context)),
          MainPage.routeName: (_) => const MainPage(),
          SearchPage.routeName: (_) => const SearchPage(),
        },
        initialRoute: preferences.getBool('isWelcomePageShowed') != null
            ? MainPage.routeName
            : WelcomePage.routeName,
      ),
    );
  }

  void _onShowWelcomePage(BuildContext context) {
    preferences.setBool('isWelcomePageShowed', true);
    Navigator.of(context).pushReplacementNamed(MainPage.routeName);
  }
}
