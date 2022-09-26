import 'package:flutter/material.dart';
import 'package:simple_weather_app/src/widgets/pages/search_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static String routeName = "main";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SearchPage.routeName),
            icon: const Icon(Icons.search_rounded),
            color: const Color(0xFFC4C4C4),
            splashRadius: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Placeholder(
              fallbackHeight: 200,
              fallbackWidth: 200,
              child: Center(
                child: Text("Weather image"),
              ),
            ),
            SizedBox(height: 16.0),
            Placeholder(
              fallbackHeight: 24.0,
              child: Center(
                child: Text("Location"),
              ),
            ),
            SizedBox(height: 16.0),
            Placeholder(
              fallbackHeight: 70,
              child: Center(
                child: Text("Temp"),
              ),
            ),
            SizedBox(height: 16.0),
            Placeholder(
              fallbackHeight: 64,
              child: Center(
                child: Text("Info"),
              ),
            ),
            SizedBox(height: 16.0),
            Placeholder(
              fallbackHeight: 230,
              child: Center(
                child: Text("Sunset"),
              ),
            ),
            SizedBox(height: 16.0),
            Placeholder(
              fallbackHeight: 24.0,
              child: Center(
                child: Text("Page indicator"),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
