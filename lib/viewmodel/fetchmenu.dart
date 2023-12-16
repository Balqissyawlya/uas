import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uas/model/menu.dart';

class networkTe {
  final _baseUrl = 'https://6579ce1e1acd268f9afa1ee1.mockapi.io/tea';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      print(response.body);
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<tea> te = it.map((e) => tea.fromJson(e)).toList();
        return te;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class networkCof {
  final _baseUrl = 'https://657b1d78394ca9e4af13bfb4.mockapi.io/coffee';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      print(response.body);
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<coffee> cof = it.map((e) => coffee.fromJson(e)).toList();
        return cof;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class networkDes {
  final _baseUrl = 'https://657b1d78394ca9e4af13bfb4.mockapi.io/dessert';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      print(response.body);
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<dessert> des = it.map((e) => dessert.fromJson(e)).toList();
        return des;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

// ignore_for_file: camel_case_types, avoid_print, file_names
