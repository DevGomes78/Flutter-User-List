import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_users/constants/service_constants.dart';
import 'package:flutter_users/constants/string_costants.dart';
import 'package:flutter_users/data/models/user_models.dart';
import 'package:http/http.dart' as http;

class UserController extends ChangeNotifier {
  List<Users> lista = [];
  late Map data;

  Future<List<Users>> getUser({required String query}) async {
    try {
      final response = await http.get(Uri.parse(ServiceConstants.baseUrl));
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        data['users'].forEach((item) => lista.add(Users.fromJson(item)));
        if (query.length > 1) {
          lista = lista
              .where((item) =>
                  item.firstName!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
        notifyListeners();
        return lista;
      }
    } catch (e) {
      print('${StringConstants.Erro}  $e');
    }
    return [];
  }
}
