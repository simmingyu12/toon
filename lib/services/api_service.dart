import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toon/models/webtoon_model.dart';


class ApiService {
  static const String basUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async{
    List<WebtoonModel> webtoonInstances = [];
    final Url = Uri.parse('$basUrl/$today');
    final response = await http.get(Url);
    if(response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}