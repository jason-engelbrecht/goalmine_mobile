import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/objective/objective.dart';

class ObjectiveCard extends StatelessWidget {
  final Objective objective;
  ObjectiveCard({this.objective});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Card(
            elevation: 2.5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 5),
                child: ListTile(
                  title: Container(
                    margin: EdgeInsets.only(bottom: 2.5),
                    child: Text('About',
                        style: TextStyle(fontWeight: FontWeight.w500))),
                  subtitle: Text('${objective.objectiveDescription}'),
                  leading: Icon(
                    Icons.assignment_turned_in,
                    color: Colors.red[400],
                  )
                ))));
  }
}
