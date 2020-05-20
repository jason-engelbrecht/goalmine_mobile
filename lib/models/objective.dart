import 'dart:convert';

List<Objective> objectivesFromJson(String str) => List<Objective>.from(json.decode(str).map((x) => Objective.fromJson(x)));

String objectivesToJson(List<Objective> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Objective {
  int id;
  int objectiveNum;
  DateTime startDate;
  DateTime endDate;
  String objectiveDescription;
  String criteria;
  String procedure;
  bool revised;
  String evidence;
  bool completed;
  bool atOpportunity;
  int frequency;
  String timePeriod;
  //other stuff

  Objective({
    this.id,
    this.objectiveNum,
    this.startDate,
    this.endDate,
    this.objectiveDescription,
    this.criteria,
    this.procedure,
    this.revised,
    this.evidence,
    this.completed,
    this.atOpportunity,
    this.frequency,
    this.timePeriod,
  });

  factory Objective.fromJson(Map<String, dynamic> json) => Objective(
    id: json["ID"],
    objectiveNum: json["ObjectiveNum"],
    startDate: DateTime.parse(json["StartDate"]),
    endDate: DateTime.parse(json["EndDate"]),
    objectiveDescription: json["ObjectiveDescription"],
    criteria: json["Criteria"],
    procedure: json["Procedure"],
    revised: json["Revised"],
    evidence: json["Evidence"],
    completed: json["Completed"],
    atOpportunity: json["AtOpportunity"],
    frequency: json["Frequency"],
    timePeriod: json["TimePeriod"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ObjectiveNum": objectiveNum,
    "StartDate": startDate.toIso8601String(),
    "EndDate": endDate.toIso8601String(),
    "ObjectiveDescription": objectiveDescription,
    "Criteria": criteria,
    "Procedure": procedure,
    "Revised": revised,
    "Evidence": evidence,
    "Completed": completed,
    "AtOpportunity": atOpportunity,
    "Frequency": frequency,
    "TimePeriod": timePeriod,
  };
}