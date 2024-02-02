import 'dart:convert';
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
  final apiUrl = 'https://api.jikan.moe/v4/$resource';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse.containsKey('data')) {
      final List<dynamic> data = jsonResponse['data'];

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
  } else {
    throw Exception('Failed to load anime data');
  }
}
