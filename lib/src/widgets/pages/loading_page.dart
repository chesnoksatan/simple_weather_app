import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/pages/weather_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  static const String url = "/loading";

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ServiceController>();
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (controller.isError != null || controller.errorString != null) {
            print(controller.errorString);
          } else if (controller.currentWeather != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, WeatherPage.url);
            });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
