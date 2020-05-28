import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalmine_mobile/services/evidence_service.dart';
import 'package:goalmine_mobile/services/note_service.dart';
import 'package:goalmine_mobile/models/objective.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/models/note.dart';
import 'package:goalmine_mobile/dark_mode/dark_mode.dart';
import 'package:provider/provider.dart';

class Objectives extends StatefulWidget {
  final Objective objective;
  final Parent parent;
  final Note note;
  const Objectives({Key key, this.objective, this.parent, this.note})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ObjectiveState();
}

class ObjectiveState extends State<Objectives> {
  NoteService _noteService = NoteService();
  EvidenceService _evidenceService = EvidenceService();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.red),
          title: Text('GoalMine',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  letterSpacing: 1.0)),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'GoalMine',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              letterSpacing: 1.0),
                        ),
                        margin: EdgeInsets.only(bottom: 5),
                      ),
                      Text(widget.parent.username,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                    ],
                  )),
              SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: themeChange.darkTheme,
                  secondary: const Icon(Icons.lightbulb_outline),
                  onChanged: (bool value) {
                    themeChange.darkTheme = value;
                  }),
              ListTile(
                leading: Icon(Icons.lock_open),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
        body: ListView (
          children: <Widget>[
            _buildObjectiveCard(widget.objective),
            _buildNoteCard(),
            _buildEvidenceCard()
          ],
        ));
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
                          Icons.assessment,
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
                            children: [
                              _buildInfoTile(Icons.arrow_right, 'Note 1'),
                              _buildInfoTile(Icons.arrow_right, 'Note 2'),
                            ])
                      ])))));
  }

  Widget _buildEvidenceCard() {
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
                      title: Text('Evidence',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      leading: Icon(
                        Icons.search,
                        color: Colors.red[400],
                      ),
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoTile(Icons.check, 'Evidence 1'),
                              _buildInfoTile(Icons.check, 'Evidence 2'),
                            ])
                      ])))));
  }

  Widget _buildInfoTile(IconData icon, String text) => ListTile(
      contentPadding: EdgeInsets.only(left: 18),
      title: Text(text, style: TextStyle(fontSize: 13)),
      dense: true, leading: Icon(icon, color: Colors.red[300], size: 15,));
}