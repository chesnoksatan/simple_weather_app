import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static String routeName = "search";

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  bool hasError = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF2C2D35),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  splashRadius: 16.0,
                  icon: const Icon(Icons.clear),
                  onPressed: searchController.clear,
                ),
                hintText: 'Search Location',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Placeholder(
              fallbackHeight: 96,
              child: Center(
                child: Text("Search history badgies"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void search() {
    final String city = searchController.text.replaceAll(' ', '');
    setState(() {
      hasError = city.isEmpty;
    });
    if (city.isNotEmpty) {
      Provider.of<ServiceController>(context, listen: false)
          .requestWeather(city);
    }
  }
}
