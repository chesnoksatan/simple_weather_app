import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/pages/search_page.dart';
import 'package:simple_weather_app/src/widgets/pages/weather_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ServiceController>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) {
              if (controller.isError != null ||
                  controller.errorString != null) {
                // show alert
                print(controller.errorString);
              }

              if (controller.currentWeather != null) {
                return const WeatherPage();
              } else if (controller.inProgress) {
                return const CircularProgressIndicator();
              } else {
                return const SearchPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
