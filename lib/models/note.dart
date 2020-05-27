import 'dart:convert';

List<Note> notesFromJson(String str) =>
    List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String notesToJson(List<Note> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Note {
  int id;
  String text;
  String creator;
  DateTime dateCreated;

  Note({
    this.id,
    this.text,
    this.creator,
    this.dateCreated
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
      id: json["ID"],
      text: json["Text"],
      creator: json["Creator"],
    dateCreated: DateTime.parse(json["DateCreated"])
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Text": text,
    "Creator": creator,
    "DateCreated": dateCreated.toIso8601String()
  };

  @override
  String toString() {
    return 'Note{id: $id, text: $text, creator: $creator, ' +
        'date created: $dateCreated}';
  }
}