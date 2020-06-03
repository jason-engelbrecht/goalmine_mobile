import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/objective/objective.dart';

class ObjectiveCard extends StatelessWidget {
  final Objective objective;
  ObjectiveCard({this.objective});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5),
        child: Card(
            elevation: 2.5,
            shape:
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
                child: ListTile(
                    title: Text('${objective.objectiveDescription}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        )),
                    leading: Icon(
                      Icons.access_time,
                      color: Colors.red[400],
                    )))));
  }
}
