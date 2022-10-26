import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Models/locationmodel.dart';

import 'package:http/http.dart' as http;

class ApiLocService {
  var list = <Locations>[];

  Future<List<Locations>> getLocationData() async {
    print('check here');
    String link = 'https://rickandmortyapi.com/api/location';
    final res = await http
        .get(Uri.parse(link), headers: {"Accept": "application/json"});

    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["results"] as List;
      print(rest);

      list = rest.map<Locations>((json) => Locations.fromJson(json)).toList();
    }
    return list;
  }
}

final apiprovider = Provider<ApiLocService>((ref) => ApiLocService());
