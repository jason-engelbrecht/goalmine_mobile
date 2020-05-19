import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:goalmine_mobile/models/parent.dart';

String url = 'https://goalmine-api.azurewebsites.net/api/parent';

Future<Parent> getParent(int id) async {
  final response = await http.get('$url/$id');
  return parentFromJson(response.body);
}