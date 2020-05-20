import 'dart:convert';

import 'package:goalmine_mobile/models/goal.dart';

List<Student> studentsFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentsToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  int id;
  String firstName;
  String lastName;
  String schoolDistrict;
  String school;
  bool active;
  DateTime birthDate;
  dynamic middleName;

  Student({
    this.id,
    this.firstName,
    this.lastName,
    this.schoolDistrict,
    this.school,
    this.active,
    this.birthDate,
    this.middleName
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["ID"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    schoolDistrict: json["SchoolDistrict"],
    school: json["School"],
    active: json["Active"],
    birthDate: DateTime.parse(json["BirthDate"]),
    middleName: json["MiddleName"]
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "FirstName": firstName,
    "LastName": lastName,
    "SchoolDistrict": schoolDistrict,
    "School": school,
    "Active": active,
    "BirthDate": birthDate.toIso8601String(),
    "MiddleName": middleName
  };
}