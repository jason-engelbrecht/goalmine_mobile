import 'package:goalmine_mobile/models/score.dart';
import 'package:goalmine_mobile/services/service.dart';

class ScoreService extends Service {
  Future<List<Score>> getScores(int objectiveID) async {
    final response = await client.get('$url/scores/$objectiveID');
    return scoresFromJson(response.body);
  }
}