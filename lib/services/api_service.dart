import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toon/models/webtoon_model.dart';


class ApiService {
  final String basUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons()async{
    final Url = Uri.parse('$basUrl/$today');
    final response = await http.get(Url);
    if(response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        WebtoonModel.fromJson(webtoon);
      }
      return;
    }
    throw Error();
  }
}