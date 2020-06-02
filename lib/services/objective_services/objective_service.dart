import 'package:goalmine_mobile/models/objective/objective.dart';
import 'package:goalmine_mobile/services/service.dart';

class ObjectiveService extends Service {

  Future<List<Objective>> getObjectives(int goalID) async {
    final response = await client.get('$url/objectives/$goalID');
    return objectivesFromJson(response.body);
  }
}
