import 'dart:convert';

import 'package:fluttertube/models/video.dart';
import 'package:http/http.dart' as http;

const API_KEY = 'AIzaSyAXMjLANdQ5XKLdfMNnI3bxIbU4Kyyn0EU';

class Api {
  search(String search) async {
    var response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");

    return decode(response);
  }

  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      var videos =
          decoded['items'].map<Video>((m) => Video.fromJson(m)).toList();


      return videos;
    }{
      throw Exception('Deu erro!');
    }
  }
}
