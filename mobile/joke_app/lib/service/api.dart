import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:joke_app/models/joke.dart';

class Api {
  static const BaseUrl = "http://192.168.0.110:3000/";

  static Future<List<Joke>> fetJokes() async {
    List<Joke> jokes = [];
    const baseUrl = "${BaseUrl}jokes";

    try {
      final res = await http.get(Uri.parse(baseUrl));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        data['jokes'].forEach(
          (value) => {jokes.add(Joke.fromJson(value))},
        );
      }
      return jokes;
    } catch (ex) {
      print(ex);
    }
    return [];
  }

  static void addVote(Map<String, dynamic> value) async {
    const baseUrl = "${BaseUrl}votes";
    try {
      final res = await http.post(Uri.parse(baseUrl), body: value);
      if (res.statusCode == 201) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get reponse");
      }
    } catch (ex) {
      print(ex);
    }
  }
}
