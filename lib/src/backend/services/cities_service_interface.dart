abstract class ICitiesService {
  final List<String> cities = List<String>.empty(growable: true);

  List<String> getSuggestions(String pattern);
}
