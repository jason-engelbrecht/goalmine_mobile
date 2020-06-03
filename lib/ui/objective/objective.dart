import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalmine_mobile/services/objective_services/note_service.dart';
import 'package:goalmine_mobile/models/objective/objective.dart';
import 'package:goalmine_mobile/services/objective_services/score_service.dart';
import 'package:goalmine_mobile/ui/loading_screen.dart';
import 'package:goalmine_mobile/ui/objective/notes.dart';
import 'package:goalmine_mobile/ui/objective/objective_card.dart';
import 'package:goalmine_mobile/ui/objective/score_cards.dart';
import 'package:goalmine_mobile/ui/objective/score_chart.dart';

class Objectives extends StatefulWidget {
  final Objective objective;

  const Objectives({Key key, this.objective}) : super(key: key);

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
        widget.objective.scores.isEmpty; //|| widget.objective.notes.isEmpty;

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
          title: Text('Objective ${widget.objective.objectiveNum}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  letterSpacing: 1.0)),
        ),
        body: ListView(
          children: <Widget>[
            ScoreCards(scores: widget.objective.scores),
            SizedBox(
                height: 250,
                child: Card(
                    elevation: 2.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 5),
                        child: ScoreChart(
                            animate: true, scores: widget.objective.scores)))),
            ObjectiveCard(objective: widget.objective),
            Notes(notes: widget.objective.notes)
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    widget.objective.notes = null;
    widget.objective.scores = null;
  }

  void _getNotes() {
    _noteService
        .getNotes(widget.objective.id)
        .then((notes) => setState(() => widget.objective.notes = notes));
  }

  void _getScores() {
    _scoreService
        .getScores(widget.objective.id)
        .then((scores) => setState(() => widget.objective.scores = scores));
  }
}
