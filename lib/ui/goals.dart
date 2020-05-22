import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/goal.dart';
import 'package:goalmine_mobile/models/student.dart';

class Goals extends StatefulWidget {
  final List<Student> students;
  final List<Goal> goals;
  const Goals({Key key, this.students, this.goals})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => GoalsState();
}

class GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      SizedBox(
          height: 50,
          child: ListView.builder(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              scrollDirection: Axis.horizontal,
              itemCount: widget.students.length,
              itemBuilder: (context, int i) {
                return _studentChip(widget.students[i]);
              })),
      Expanded(
          child: ListView.builder(
        itemCount: widget.goals.length,
        itemBuilder: (context, int i) {
          return _goalCard(widget.goals[i]);
        },
      ))
    ]);
  }

  Widget _studentChip(Student student) {
    String name = '${student.firstName} ${student.lastName}';

    return Container(
        margin: EdgeInsets.only(left: 10),
        child: ActionChip(
          elevation: 2.5,
          avatar: Icon(Icons.check, color: Colors.white),
          label:
              Text(name, style: TextStyle(color: Colors.white, fontSize: 16)),
          backgroundColor: Colors.red[400],
          onPressed: () => print(name),
        ));
  }

  Widget _goalCard(Goal goal) {
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
                        title: Text(goal.goalDescription,
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        leading: Icon(
                          Icons.assessment,
                          color: Colors.red[400],
                        ),
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _type(goal.goalType),
                                _subject(goal.subject),
                                _staff(goal.staffResponsible),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 5, right: 10),
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(children: <Widget>[
                                          _objectiveChip('objective', 1),
                                          _objectiveChip('objective', 1),
                                          _objectiveChip('objective', 1)
                                        ])))
                              ])
                        ])))));
  }

  Widget _type(String type) => ListTile(
      title: Text(type, style: TextStyle(fontSize: 15)),
      dense: true,
      leading: Icon(
        Icons.subject,
        color: Colors.red[300],
      ));

  Widget _subject(String subject) => ListTile(
      title: Text(subject, style: TextStyle(fontSize: 15)),
      dense: true,
      leading: Icon(
        Icons.school,
        color: Colors.red[300],
      ));

  Widget _staff(String staff) => ListTile(
      title: Text(staff, style: TextStyle(fontSize: 15)),
      dense: true,
      leading: Icon(
        Icons.assignment_ind,
        color: Colors.red[300],
      ));

  Widget _objectiveChip(String objective, int objectiveId) => Container(
      margin: EdgeInsets.only(left: 10),
      child: ActionChip(
        elevation: 1,
        avatar: Icon(
          Icons.access_time,
          size: 17.5,
        ),
        label: Text(objective),
        labelPadding: EdgeInsets.only(left: 2.5, right: 5),
        onPressed: () => print(objective),
      ));
}