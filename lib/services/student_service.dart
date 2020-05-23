import 'package:goalmine_mobile/models/student.dart';
import 'package:goalmine_mobile/services/service.dart';
import 'dart:async';

class StudentService extends Service {

  Future<List<Student>> getStudents(int parentID) async {
    final response = await client.get('$url/students/$parentID');
    return studentsFromJson(response.body);
  }
}