import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/services/parent_service.dart';

class Goals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GoalsState();
}

class GoalsState extends State {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
      children: <Widget>[
        goalCard(),
        goalCard(),
        FutureBuilder<Parent>(
            future: getParent(2),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done)
                return Text('Username : ${snapshot.data.username}');
              else
                return CircularProgressIndicator();
            }
        )
      ]
    );
  }

  Widget goalCard() {
    final transparentBorders = Theme.of(context).
    copyWith(dividerColor: Colors.transparent);

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
          elevation: 2.5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: Theme(
              data: transparentBorders,
              child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 10),
                  child: ExpansionTile(
                      title: Text('Goal',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      leading: Icon(
                        Icons.assessment,
                        color: Colors.red[300],
                      ),
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              type('type'),
                              subject('subject'),
                              staff('staff'),
                              Container(
                                  padding: EdgeInsets.only(left: 5, right: 10),
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: <Widget>[
                                            objectiveChip('objective 1', 1),
                                            objectiveChip('objective 1', 1),
                                            objectiveChip('objective 1', 1)
                                          ]))
                              )
                            ])
                      ]))
          )));
  }

  Widget type(String type) => ListTile(
      title: Text(type,
          style: TextStyle(fontWeight: FontWeight.w400)),
      leading: Icon(
        Icons.subject,
        color: Colors.red[300],
      ));

  Widget subject(String subject) => ListTile(
      title: Text(subject),
      leading: Icon(
        Icons.school,
        color: Colors.red[300],
      ));

  Widget staff(String staff) => ListTile(
      title: Text(staff),
      leading: Icon(
        Icons.assignment_ind,
        color: Colors.red[300],
      ));

  Widget objectiveChip(String objective, int objectiveId) => Container(
      margin: EdgeInsets.only(left: 10),
      child: Chip(
        avatar: Icon(Icons.check),
        label: Text(objective),
        backgroundColor: Colors.red[100],
      ));
}