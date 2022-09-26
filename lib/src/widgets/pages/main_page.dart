import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, left: 32.0, right: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Placeholder(
            fallbackHeight: 46.0,
            child: Center(
              child: Text("Search"),
            ),
          ),
          SizedBox(height: 16.0),
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
        ],
      ),
    );
  }
}
