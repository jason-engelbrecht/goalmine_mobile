import 'package:goalmine_mobile/models/goal.dart';
import 'package:goalmine_mobile/services/service.dart';
import 'dart:async';

class GoalService extends Service {

  Future<List<Goal>> getGoals(int studentID) async {
    final response = await client.get('$url/goals/$studentID');
    return goalsFromJson(response.body);
  }
}