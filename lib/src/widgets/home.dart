import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/pages/search_page.dart';
import 'package:simple_weather_app/src/widgets/pages/weather_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServiceController controller = context.watch<ServiceController>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 400
                    : MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Center(
              child: Builder(
                builder: (context) {
                  if (controller.isError != null ||
                      controller.errorString != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _showMyDialog(context);
                    });
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
        ),
      ),
    );
  }

  _showMyDialog(BuildContext context) {
    final ServiceController controller =
        Provider.of<ServiceController>(context, listen: false);

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ошибка запроса погоды'),
          content: Text(controller.errorString!),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                controller.clearData();
                Navigator.of(context).pop();
              },
              child: const Text('Ок'),
            ),
          ],
        );
      },
    );
  }
}
