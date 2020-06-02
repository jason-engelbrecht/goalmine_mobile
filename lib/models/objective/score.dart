import 'dart:convert';

List<Score> scoresFromJson(String str) =>
    List<Score>.from(json.decode(str).map((x) => Score.fromJson(x)));

String scoresToJson(List<Score> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Score {
  int id;
  int objectiveId;
  int score;
  DateTime dateRecorded;
  DateTime date;

  Score({
    this.id,
    this.objectiveId,
    this.score,
    this.dateRecorded,
    this.date,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    id: json["ID"],
    objectiveId: json["ObjectiveId"],
    score: json["Score"],
    dateRecorded: DateTime.parse(json["DateRecorded"]),
    date: DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ObjectiveId": objectiveId,
    "Score": score,
    "DateRecorded": dateRecorded.toIso8601String(),
    "Date": date.toIso8601String(),
  };

  @override
  String toString() {
    return 'Score{id: $id, objectiveId: $objectiveId, score: $score, dateRecorded: $dateRecorded, date: $date}';
  }
}
