import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/goal.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/models/student.dart';
import 'package:goalmine_mobile/models/objective/objective.dart';
import 'package:goalmine_mobile/ui/objective/objectives.dart';

class Goals extends StatefulWidget {
  final List<Student> students;
  final List<Goal> goals;
  final Parent parent;
  const Goals({Key key, this.students, this.goals, this.parent})
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
                return _buildStudentChip(widget.students[i]);
              })),
      Expanded(
          child: ListView.builder(
              itemCount: widget.goals.length,
              itemBuilder: (context, int i) {
                return _buildGoalCard(widget.goals[i]);
              }))
    ]);
  }

  Widget _buildStudentChip(Student student) {
    String name = '${student.firstName} ${student.lastName}';

    return Container(
        margin: EdgeInsets.only(left: 10),
        child: ActionChip(
          elevation: 2.5,
          avatar: Icon(Icons.account_circle, color: Colors.white),
          label:
              Text(name, style: TextStyle(color: Colors.white, fontSize: 16)),
          backgroundColor: Colors.red[400],
          onPressed: () => print(name),
        ));
  }

  Widget _buildGoalCard(Goal goal) {
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
                                _buildGoalInfoTile(Icons.subject, goal.goalType),
                                _buildGoalInfoTile(Icons.school, goal.subject),
                                _buildGoalInfoTile(Icons.assignment_ind, goal.staffResponsible),
                                SizedBox(
                                  height: 50,
                                    child: ListView.builder(
                                        padding: EdgeInsets.only(left: 5, right: 5),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: goal.objectives.length,
                                        itemBuilder: (context, int i) {
                                          return _buildObjectiveChip(goal.objectives[i]);
                                        }))
                              ])
                        ])))));
  }

  Widget _buildGoalInfoTile(IconData icon, String text) => ListTile(
      title: Text(text, style: TextStyle(fontSize: 15)),
      dense: true, leading: Icon(icon, color: Colors.red[300]));

  Widget _buildObjectiveChip(Objective objective) {
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: ActionChip(
            elevation: 1,
            avatar: Icon(Icons.access_time, size: 17.5),
            label: Text("objective ${objective.objectiveNum}"),
            labelPadding: EdgeInsets.only(left: 2.5, right: 5),
            onPressed: () => {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  Objectives(objective: objective, parent: widget.parent,)),
              )}));
            //TODO send objective to an objective page
  }
}