import 'dart:convert';

import 'package:goalmine_mobile/models/student.dart';

Parent parentFromJson(String str) => Parent.fromJson(json.decode(str));

String parentToJson(Parent data) => json.encode(data.toJson());

class Parent {
  int id;
  String username;
  bool isActive;
  List<Student> students;

  Parent({
    this.id,
    this.username,
    this.isActive,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
    id: json["ID"],
    username: json["Username"],
    isActive: json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Username": username,
    "IsActive": isActive,
  };

  @override
  String toString() {
    return 'Parent{id: $id, username: $username, isActive: $isActive}';
  }
}