import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
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
    for (var i = 0; i < data.length; i++) {
      var item = data[i];
      if (item.containsKey(objectProperty)) {
        itemList.addAll(item[objectProperty]);
      }
    }

    return itemList;
  } else {
    throw Exception('Response data is undefined');
  }
}

Future<Map<String, dynamic>> reproduce(List<dynamic> data, int gap) async {
  try {
    if (data != null && data.isNotEmpty) {
      final random = Random();
      final first = random.nextInt(data.length - gap + 1);
      final last = first + gap;

      final response = {'data': data.sublist(first, last)};
      return response;
    } else {
      if (kDebugMode) {
        print("Data is undefined or empty: $data");
      }

      return {'data': []};
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error reproducing anime data: $e");
    }
    rethrow;
  }
}
