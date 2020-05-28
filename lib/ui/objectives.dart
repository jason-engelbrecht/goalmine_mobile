import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final Color primaryColor = Theme.of(context).primaryColor;

    _buildNotes();
    _buildEvidence();

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
            _buildObjective(widget.objective),
            _buildNotes(),
            _buildEvidence()
          ],
        ));
  }

  Widget _buildObjective(Objective objective) {
    String description = 'Objective ' + '${objective.objectiveNum}' + ': \n' +
        '${objective.objectiveDescription}';

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Container(
          child: Text(description, style: TextStyle(color: Colors.white, fontSize: 16)),
          color: Colors.redAccent,
          padding: EdgeInsets.all(15),
        ),
    );
  }

  Widget _buildNotes() {
    String description = 'Notes: \n';

    return Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Container(
          child: Text(description, style: TextStyle(color: Colors.white, fontSize: 16)),
          color: Colors.redAccent,
          padding: EdgeInsets.all(15),
        )
    );
  }

  Widget _buildEvidence() {
    String description = 'Evidence: \n';

    return Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Container(
          child: Text(description, style: TextStyle(color: Colors.white, fontSize: 16)),
          color: Colors.redAccent,
          padding: EdgeInsets.all(15),
        )
    );
  }
}