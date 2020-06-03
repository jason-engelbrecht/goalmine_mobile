import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/objective/objective.dart';

class ObjectiveCard extends StatelessWidget {
  final Objective objective;
  ObjectiveCard({this.objective});

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
}
