import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Service {
  var client = http.Client();
  final String url = 'https://goalmine-api.azurewebsites.net/api';

  void openConnection() async {
    await client.get(url);
    debugPrint('connection established');
  }
}
