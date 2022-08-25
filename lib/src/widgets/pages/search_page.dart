import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Введите название города',
              errorText:
                  hasError ? 'Название города не может быть пустым' : null,
            )),
        const SizedBox(height: 16.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48), // NEW
          ),
          onPressed: search,
          child: const Text("Поиск"),
        ),
      ],
    );
  }

  void search() {
    final String city = searchController.text.replaceAll(' ', '');
    setState(() {
      hasError = city.isEmpty;
    });
    if (city.isNotEmpty) {
      context.read<ServiceController>().requestWeather(city);
    }
  }
}
