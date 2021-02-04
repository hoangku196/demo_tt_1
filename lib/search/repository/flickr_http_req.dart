import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FlickrHttpClient {
  static const baseUrl = 'https://www.flickr.com/services/rest';
  http.Client client;

  FlickrHttpClient({@required this.client});

  Future<String> getAPI() async {
    var res = await client.post(
      baseUrl,
      body: {
        'method' : 'flickr.favorites.getList',
        'api_key' : '0375ce0a9316a6865766bc1068fcc213',
        'user_id' : '191172940@N06',
        'extras' : 'url_m',
        'page' : '1',
        'per_page' : '5',
        'format' : 'json',
        'nojsoncallback' : '1',
      },
    );
    print('Response status: ${res.statusCode}');
    print('Response.body: ${res.body}');

    return res.body;
  }
}
