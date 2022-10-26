import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Models/episodemodel.dart';

import 'package:http/http.dart' as http;

class ApiEpiService {
  var list = <Episodes>[];

  Future<List<Episodes>> getEpisodeData() async {
    print('check here');
    String link = 'https://rickandmortyapi.com/api/episode';
    final res = await http
        .get(Uri.parse(link), headers: {"Accept": "application/json"});

    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["results"] as List;
      print(rest);

      list = rest.map<Episodes>((json) => Episodes.fromJson(json)).toList();
    }
    return list;
  }
}

final episodeapiprovider = Provider<ApiEpiService>((ref) => ApiEpiService());
