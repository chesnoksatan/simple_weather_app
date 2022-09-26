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
        // The search area here
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF2C2D35),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search Location',
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     TextField(
    //       controller: searchController,
    //       decoration: InputDecoration(
    //         border: const OutlineInputBorder(),
    //         labelText: 'Введите название города',
    //         errorText: hasError ? 'Название города не может быть пустым' : null,
    //       ),
    //     ),
    //     const SizedBox(height: 16.0),
    //     ElevatedButton(
    //       style: ElevatedButton.styleFrom(
    //         minimumSize: const Size.fromHeight(48),
    //       ),
    //       onPressed: search,
    //       child: const Text("Поиск"),
    //     ),
    //   ],
    // );
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
