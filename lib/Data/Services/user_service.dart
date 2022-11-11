import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/charactermodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var list = <Results>[];

  Future<List<Results>> getData() async {
    print('check here');
    String link = 'https://rickandmortyapi.com/api/character';
    final res = await http
        .get(Uri.parse(link), headers: {"Accept": "application/json"});

    // print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["results"] as List;
      //   print(rest);

      list = rest.map<Results>((json) => Results.fromJson(json)).toList();
    }
    return list;
  }
}

final apiprover = Provider<ApiService>((ref) => ApiService());
