import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_users/data/models/user_models.dart';
import 'package:http/http.dart' as http;

class UserController extends ChangeNotifier {
  final String url = 'http://dummyjson.com/users';
  List<dynamic> users = [];

  Future<void> getUser() async {
    try {
      final baseUrl = Uri.parse(url);
      final response = await http.get(baseUrl);
      if (response.statusCode == 200) {
        var decodejson = jsonDecode(response.body);
        users = decodejson['users'];
        notifyListeners();
      }
    } catch (e) {
      print('Erro ao acessar a Pagina: $e');
    }
  }
}