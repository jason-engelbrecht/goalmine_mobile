import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/models/student.dart';

class Goals extends StatefulWidget {
  final Parent parent;
  final List<Student> students;
  const Goals({Key key, this.parent, this.students}) : super(key : key);

  @override
  State<StatefulWidget> createState() => GoalsState();
}

class GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        itemCount: widget.students.length,
        itemBuilder: (BuildContext context, int position) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: <Widget>[
                    studentChip(widget.students[position].firstName, 1),
                  ])),
                  goalCard('Lina will complete 3 digit subtractions by the end of the year'),
                  goalCard('Lina will complete 3 digit subtractions by the end of the year'),
                ]);
        });
  }

  Widget studentChip(String name, int studentId) => Container(
      margin: EdgeInsets.only(left: 10),
      child: ActionChip(
        elevation: 2.5,
        avatar: Icon(Icons.check, color: Colors.white),
        label: Text(name, style: TextStyle(color: Colors.white, fontSize: 16)),
        backgroundColor: Colors.red[400],
        onPressed: () => print(name),
      ));

  Widget goalCard(String goal) {
    final transparentBorders =
        Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Padding(
        padding: EdgeInsets.only(bottom: 5, top: 5),
        child: Card(
            elevation: 2.5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Theme(
                data: transparentBorders,
                child: Container(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 5),
                    child: ExpansionTile(
                        title: Text(goal,
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        leading: Icon(
                          Icons.assessment,
                          color: Colors.red[400],
                        ),
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                type('type'),
                                subject('subject'),
                                staff('staff'),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 5, right: 10),
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(children: <Widget>[
                                          objectiveChip('objective', 1),
                                          objectiveChip('objective', 1),
                                          objectiveChip('objective', 1)
                                        ])))
                              ])
                        ])))));
  }

  Widget type(String type) => ListTile(
      title: Text(type, style: TextStyle(fontSize: 15)),
      dense: true,
      leading: Icon(
        Icons.subject,
        color: Colors.red[300],
      ));

  Widget subject(String subject) => ListTile(
      title: Text(subject, style: TextStyle(fontSize: 15)),
      dense: true,
      leading: Icon(
        Icons.school,
        color: Colors.red[300],
      ));

  Widget staff(String staff) => ListTile(
      title: Text(staff, style: TextStyle(fontSize: 15)),
      dense: true,
      leading: Icon(
        Icons.assignment_ind,
        color: Colors.red[300],
      ));

  Widget objectiveChip(String objective, int objectiveId) => Container(
      margin: EdgeInsets.only(left: 10),
      child: ActionChip(
        elevation: 1,
        avatar: Icon(Icons.access_time, size: 17.5,),
        label: Text(objective),
        labelPadding: EdgeInsets.only(left: 2.5, right: 5),
        onPressed: () => print(objective),
      ));
}
