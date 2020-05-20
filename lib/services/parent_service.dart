import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:goalmine_mobile/models/parent.dart';

class ParentService {
  final String url = 'https://goalmine-api.azurewebsites.net/api';

  Future<Parent> getParent(int id) async {
    final response = await http.get('$url/parent/$id');
    return parentFromJson(response.body);
  }

  Future<int> authLogin(String username, String password) async {
    final response = await http.post('$url/authLogin',
        body: {'username': username,
               'password': password});

    if(response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      int parentId = data["ID"];
      return parentId;
    }
    return -1;
  }
}

