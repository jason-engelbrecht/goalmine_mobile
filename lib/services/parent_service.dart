import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:goalmine_mobile/models/parent.dart';

class ParentService {
  final String baseUrl = 'https://goalmine-api.azurewebsites.net/api/';

  Future<Parent> getParent(int id) async {
    final response = await http.get('$baseUrl/parent/$id');
    return parentFromJson(response.body);
  }
}

