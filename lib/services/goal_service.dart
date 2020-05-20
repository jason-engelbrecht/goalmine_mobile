import 'package:goalmine_mobile/models/goal.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class GoalService {
  final String url = 'https://goalmine-api.azurewebsites.net/api';

  Future<List<Goal>> getGoals(int studentID) async {
    final response = await http.get('$url/goals/$studentID');
    return goalsFromJson(response.body);
  }
}