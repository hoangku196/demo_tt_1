import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:demo_app/models/models.dart';

class PhotoApiProvider {
  String baseUrl = 'https://jsonplaceholder.typicode.com/photos/';

  Future<List<Photo>> fetchPhotosByAlbumId(String albumId, int startIndex, int limit) async {
    final response = await http.get(baseUrl + '?albumId=$albumId&?_start=$startIndex&_limit=$limit');

    return parseResponse(response);
  }

  List<Photo> parseResponse(http.Response res) {
    final parsed = jsonDecode(res.body).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
