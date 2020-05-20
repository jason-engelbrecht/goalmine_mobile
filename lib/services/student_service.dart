import 'package:goalmine_mobile/models/student.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class StudentService {
  final String url = 'https://goalmine-api.azurewebsites.net/api';

  Future<List<Student>> getStudents(int parentID) async {
    final response = await http.get('$url/students/$parentID');
    return studentsFromJson(response.body);
  }

  void test() {
    getStudents(0).then((students) =>
      students.forEach((student) => print(student.firstName)));
  }
}