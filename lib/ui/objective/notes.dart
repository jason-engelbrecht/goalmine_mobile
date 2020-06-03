import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/objective/note.dart';
import 'package:intl/intl.dart';

class Notes extends StatelessWidget {
  final List<Note> notes;
  Notes({this.notes});

  @override
  Widget build(BuildContext context) {
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
                        title: Text('Notes'),
                        leading: Icon(
                          Icons.assignment,
                          color: Colors.red[400],
                        ),
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  notes.length,
                                  (index) => _buildNoteTile(
                                      notes[index].dateCreated,
                                      notes[index].text)))
                        ])))));
  }

  Widget _buildNoteTile(DateTime date, String note) {
    String formattedDate = DateFormat('MM/dd/yy').format(date);
    return ListTile(
        contentPadding: EdgeInsets.only(left: 18),
        title: Text(note, style: TextStyle(fontSize: 13)),
        dense: true,
        leading: Text(formattedDate, style: TextStyle(fontSize: 13)));
  }
}
