import 'package:goalmine_mobile/services/service.dart';
import 'dart:async';
import 'package:goalmine_mobile/models/parent.dart';

class ParentService extends Service {

  Future<Parent> getParent(int id) async {
    final response = await client.get('$url/parent/$id');
    return parentFromJson(response.body);
  }

  Future<Parent> authLogin(String username, String password) async {
    final response = await client.post('$url/authLogin',
        body: {'username': username,
               'password': password});

    if(response.statusCode == 200) {
      return parentFromJson(response.body);
    }
    return null;
  }
}

