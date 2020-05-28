import 'package:goalmine_mobile/models/note.dart';
import 'package:goalmine_mobile/services/service.dart';

class NoteService extends Service {
  Future<List<Note>> getNotes(int objectiveID) async {
    final response = await client.get('$url/notes/$objectiveID');
    return notesFromJson(response.body);
  }
}