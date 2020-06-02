import 'package:goalmine_mobile/models/objective/evidence.dart';
import 'package:goalmine_mobile/services/service.dart';

class EvidenceService extends Service {

  Future<List<Evidence>> getEvidence(int objectiveID) async {
    final response = await client.get('$url/evidence/$objectiveID');
    return evidenceFromJson(response.body);
  }
}