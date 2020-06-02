import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalmine_mobile/services/objective_services/note_service.dart';
import 'package:goalmine_mobile/models/objective/objective.dart';
import 'package:goalmine_mobile/models/objective/note.dart';
import 'package:goalmine_mobile/services/objective_services/score_service.dart';
import 'package:goalmine_mobile/ui/loading_screen.dart';
import 'package:goalmine_mobile/ui/objective/score_chart.dart';

class Objectives extends StatefulWidget {
  final Objective objective;
  final Note note;
  const Objectives({Key key, this.objective, this.note})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ObjectiveState();
}

class ObjectiveState extends State<Objectives> {
  NoteService _noteService = NoteService();
  ScoreService _scoreService = ScoreService();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    bool isLoading =
        widget.objective.scores == null || widget.objective.notes == null ||
        widget.objective.scores.isEmpty || widget.objective.notes.isEmpty;

    if(isLoading) {
      if(mounted) {
        _getScores();
        _getNotes();
      }
      return LoadingScreen();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          //iconTheme: new IconThemeData(color: Colors.red),
          title: Text('Objective 1',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  letterSpacing: 1.0)),
        ),
        body: ListView (
          children: <Widget>[
            _buildObjectiveCard(widget.objective),
            _buildNoteCard(),
            ScoreChart(animate: true, scores: widget.objective.scores)
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    widget.objective.notes = null;
    widget.objective.scores = null;
  }

  Widget _buildObjectiveCard(Objective objective) {
    final transparentBorders =
    Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Padding(
        padding: EdgeInsets.only(top: 5),
        child: Card(
            elevation: 2.5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Theme(
                data: transparentBorders,
                child: Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 5),
                    child: ListTile(
                        title: Text('Objective ' + '${objective.objectiveNum}'
                            + ': \n',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text('${objective.objectiveDescription}'),
                        leading: Icon(
                          Icons.assignment_turned_in,
                          color: Colors.red[400],
                        ),
                        )))));
  }

  Widget _buildNoteCard() {
    final transparentBorders =
    Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Padding(
        padding: EdgeInsets.only(top: 5),
        child: Card(
            elevation: 2.5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Theme(
                data: transparentBorders,
                child: Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 5),
                    child: ExpansionTile(
                      title: Text('Notes',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      leading: Icon(
                        Icons.assignment,
                        color: Colors.red[400],
                      ),
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(widget.objective.notes.length,
                                    (index) => _buildInfoTile(Icons.arrow_right,
                                    widget.objective.notes[index].text))
                        )])))));
  }

  Widget _buildInfoTile(IconData icon, String text) => ListTile(
      contentPadding: EdgeInsets.only(left: 18),
      title: Text(text, style: TextStyle(fontSize: 13)),
      dense: true, leading: Icon(icon, color: Colors.red[300], size: 15,));

  void _getNotes() {
    _noteService.getNotes(widget.objective.id).then((notes) =>
        setState(() => widget.objective.notes = notes));
  }

  void _getScores() {
    _scoreService.getScores(widget.objective.id).then((scores) =>
        setState(() {
          widget.objective.scores = scores;
          widget.objective.scores.forEach((element) {
            print(element.toString() +  "\n");
          });
        }));
  }
}