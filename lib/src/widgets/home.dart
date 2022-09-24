import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/constants.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/pages/search_page.dart';
import 'package:simple_weather_app/src/widgets/pages/weather_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 400
                      : MediaQuery.of(context).size.width,
            ),
            child: Builder(
              builder: (context) {
                final ServiceController controller =
                    Provider.of<ServiceController>(context);

                if (controller.isError != null ||
                    controller.errorString != null) {
                  // Данный callback используется в связи с тем, что при перестроении родительского виджета
                  // нельзя использовать Navigator, потому что setState() or markNeedsBuild() called during build
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _showMyDialog(context);
                  });
                }

                if (controller.currentWeather != null) {
                  return WeatherPage(controller.currentWeather!);
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
          title: const Text(ErrorStrings.requestError),
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
