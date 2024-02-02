import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getAnimeResponse(
    String resource, String query) async {
  final apiUrl = 'https://api.jikan.moe/v4/$resource?$query';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final Map<String, dynamic> anime = json.decode(response.body);
    return anime;
  } else {
    throw Exception('Failed to load anime data');
  }
}

Future<List<dynamic>> getNestedAnimeResponse(
    String resource, String objectProperty) async {
  final response = await getAnimeResponse(resource, "");

  if (response.containsKey('data')) {
    final List<dynamic> data = response['data'];

    List<dynamic> itemList = [];
    data.forEach((item) {
      if (item.containsKey(objectProperty)) {
        itemList.addAll(item[objectProperty]);
      }
    });

    return itemList;
  } else {
    throw Exception('Response data is undefined');
  }
}

Future<Map<String, dynamic>> reproduceRecommendedAnime(
    List<dynamic> data, int gap) async {
  try {
    if (data != null && data.isNotEmpty) {
      final random = Random();
      final first = random.nextInt(data.length - gap + 1);
      final last = first + gap;

      final response = {'data': data.sublist(first, last)};
      return response;
    } else {
      print("Data is undefined or empty: $data");
      // Throw an error or return a default value here
      return {'data': []}; // Returning an empty array as a default value
    }
  } catch (e) {
    print("Error reproducing anime data: $e");
    throw e; // Throw the error to be caught by the caller
  }
}
