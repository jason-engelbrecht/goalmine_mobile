import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

Future<Objective> fetchObjective() async {
  final response = await http.get('http://10.0.2.2:3000/api/objectives/1');

  if(response.statusCode == 200) {
    log("response body: " + response.body.toString());
    Map objectiveMap = jsonDecode(response.body);
    objectiveMap.forEach((k, v) => log('oM: $k: $v'));
    log("fetch objective: " + objectiveMap.toString());
    return Objective.fromJson(objectiveMap);
  } else {
    throw Exception('Failed to load Objective');
  }
}

class Objective {
  final int objectiveNum;
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final String criteria;
  final String procedure;
  final String timePeriod;

  Objective(this.objectiveNum, this.startDate, this.endDate, this.description,
      this.criteria, this.procedure, this.timePeriod);

  Objective.fromJson(Map<String, dynamic> json)
    :
      objectiveNum = json['ObjectiveNum'],
      startDate = json['StartDate'],
      endDate = json['EndDate'],
      description = json['ObjectiveDescription'],
      criteria = json['Criteria'],
      procedure = json['Procedure'],
      timePeriod = json['TimePeriod'];

  Map<String, dynamic> toJson() => {
    'objectiveNum': objectiveNum,
    'startDate': startDate,
    'endDate':endDate,
    'description': description,
    'criteria': criteria,
    'procedure': procedure,
    'timePeriod': timePeriod
  };

}