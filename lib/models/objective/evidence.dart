import 'dart:convert';

List<Evidence> evidenceFromJson(String str) =>
    List<Evidence>.from(json.decode(str).map((x) => Evidence.fromJson(x)));

String evidenceToJson(List<Evidence> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Evidence {
  int id;
  int scoreID;
  String uploader;
  DateTime dateUploaded;
  DateTime scoreDate;

  Evidence({
    this.id,
    this.scoreID,
    this.uploader,
    this.dateUploaded,
    this.scoreDate
  });

  factory Evidence.fromJson(Map<String, dynamic> json) => Evidence(
      id: json["ID"],
      scoreID: json["ScoreID"],
      uploader: json["Uploader"],
      dateUploaded: DateTime.parse(json["DateUploaded"]),
      scoreDate: DateTime.parse(json["ScoreDate"])
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "ScoreID": scoreID,
    "Uploader": uploader,
    "DateUploaded": dateUploaded.toIso8601String(),
    "ScoreDate": scoreDate.toIso8601String()
  };

  @override
  String toString() {
    return 'Evidence{id: $id, scoreId: $scoreID, uploader: $uploader, date '
        'uploaded: $dateUploaded, score date: $scoreDate}';
  }
}