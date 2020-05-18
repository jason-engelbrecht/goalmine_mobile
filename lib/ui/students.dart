import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import '../data/studentData.dart';

class Students extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StudentsState();
}

class StudentsState extends State {
  Future<Objective> futureObjective;

  @override
  void initState() {
    super.initState();
    futureObjective = fetchObjective();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        children: <Widget>[
          studentCard('Student 1'),
          studentCard('Student 2')
        ]);
  }

  Widget studentCard(String name) {
    final transparentBorders = Theme.of(context).
                              copyWith(dividerColor: Colors.transparent);

    return Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Theme(
                data: transparentBorders,
                child: Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 10),
                    child: ExpansionTile(
                        leading: Icon(Icons.person, size: 30, color: Colors.orange),
                        title: Text(name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 19)),
                        children: <Widget>[
                          goal("Goal"),
                          objective("Objective"),
                        ]))
          )));
  }

  Widget goal(String goalTitle) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 17.5, top: 5, bottom: 5),
            child: Text(goalTitle,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87
              ),),
          )]);
  }

  Widget objective(String tempTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 17.5, top: 5, bottom: 5),
          child: FutureBuilder<Objective>(
            future: futureObjective,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                debugPrint(snapshot.data.objectiveNum.toString());
                return Text("snapshot has Data");
//                return Text(snapshot.data.description);
              } else if(snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Text("${snapshot.error}");
              }
              return Text(tempTitle);
            },
          )
        )
      ]
    );
  }
}
