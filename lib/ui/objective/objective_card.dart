import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/objective/objective.dart';

class ObjectiveCard extends StatelessWidget {
  final Objective objective;
  ObjectiveCard({this.objective});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5),
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Card(
            elevation: 2.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                child: ListTile(
                    title: Text('${objective.objectiveDescription}',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400))
                ))));
  }
}
