import 'dart:convert';

import 'package:goalmine_mobile/models/objective.dart';

List<Goal> goalsFromJson(String str) => List<Goal>.from(json.decode(str).map((x) => Goal.fromJson(x)));

String goalsToJson(List<Goal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Goal {
  int id;
  String goalType;
  String subject;
  String staffResponsible;
  String goalDescription;
  DateTime completionDate;
  bool paused;
  bool archived;
  bool trials;
  List<Objective> objectives;

  Goal({
    this.id,
    this.goalType,
    this.subject,
    this.staffResponsible,
    this.goalDescription,
    this.completionDate,
    this.paused,
    this.archived,
    this.trials,
    //assign objectives
  });

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
    id: json["ID"],
    goalType: json["GoalType"],
    subject: json["Subject"],
    staffResponsible: json["StaffResponsible"],
    goalDescription: json["GoalDescription"],
    completionDate: DateTime.parse(json["CompletionDate"]),
    paused: json["Paused"],
    archived: json["Archived"],
    trials: json["Trials"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "GoalType": goalType,
    "Subject": subject,
    "StaffResponsible": staffResponsible,
    "GoalDescription": goalDescription,
    "CompletionDate": completionDate.toIso8601String(),
    "Paused": paused,
    "Archived": archived,
    "Trials": trials,
  };
}