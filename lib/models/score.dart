import 'dart:convert';

List<Score> scoresFromJson(String str) =>
    List<Score>.from(json.decode(str).map((x) => Score.fromJson(x)));

String scoresToJson(List<Score> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Score {
  int id;
  int score;
  DateTime dateRecorded;

  Score({
    this.id,
    this.score,
    this.dateRecorded
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    id: json["ID"],
    score: json["Score"],
    dateRecorded: DateTime.parse(json["DataRecorded"])
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Score": score,
    "DateRecorded": dateRecorded.toIso8601String()
  };

  @override
  String toString() {
    return 'Score{id: $id, score: $score, date recorded: $dateRecorded}';
  }
}