import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/goal.dart';
import 'package:goalmine_mobile/models/objective/objective.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/models/student.dart';
import 'package:goalmine_mobile/services/goal_service.dart';
import 'package:goalmine_mobile/services/student_service.dart';
import 'package:goalmine_mobile/services/objective_services/objective_service.dart';
import 'package:goalmine_mobile/ui/goals.dart';
import 'package:goalmine_mobile/ui/loading_screen.dart';
import 'package:goalmine_mobile/dark_mode/dark_mode.dart';
import 'package:provider/provider.dart';

class Nav extends StatefulWidget {
  final Parent parent;
  const Nav({Key key, this.parent}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NavState();
}

class NavState extends State<Nav> {
  StudentService _studentService = StudentService();
  GoalService _goalService = GoalService();
  ObjectiveService _objectiveService = ObjectiveService();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final Color primaryColor = Theme.of(context).primaryColor;

    _createStudents();
    widget.parent.students.forEach((student) => _createGoals(student.id));

    if(widget.parent.goals != null && widget.parent.goals.isNotEmpty) {
      widget.parent.goals.forEach((goal) => _createObjectives(goal));
    }

    bool isLoading =
        (widget.parent.students == null || widget.parent.goals == null) ||
        (widget.parent.students.isEmpty || widget.parent.goals.isEmpty);

    if(isLoading) {
      return LoadingScreen();
    }

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              iconTheme: new IconThemeData(color: Colors.red),
              title: Text('GoalMine',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      letterSpacing: 1.0)),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'GoalMine',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                  letterSpacing: 1.0),
                            ),
                            margin: EdgeInsets.only(bottom: 5),
                          ),
                          Text(widget.parent.username,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              )),
                        ],
                      )),
                  SwitchListTile(
                      title: const Text('Dark Mode'),
                      value: themeChange.darkTheme,
                      secondary: const Icon(Icons.lightbulb_outline),
                      onChanged: (bool value) {
                        themeChange.darkTheme = value;
                      }),
                  ListTile(
                    leading: Icon(Icons.lock_open),
                    title: Text('Logout'),
                  ),
                ],
              ),
            ),
          body: Goals(students: widget.parent.students,
                    goals: widget.parent.goals, parent: widget.parent)));
  }

  void _getStudents() {
    _studentService.getStudents(widget.parent.id).then((students) =>
      setState(() => widget.parent.students = students));
  }

  void _createStudents() {
    if(widget.parent.students == null) {
      widget.parent.students = List<Student>();
      _getStudents();
    }
  }

  void _getGoals(int studentId) {
    _goalService.getGoals(studentId).then((goals) =>
      setState(() => widget.parent.goals.addAll(goals)));
  }

  void _createGoals(int studentId) {
    if(widget.parent.goals == null) {
      widget.parent.goals = List<Goal>();
      _getGoals(studentId);
    }
  }

  void _getObjectives(Goal goal) {
    _objectiveService.getObjectives(goal.id).then((objectives) =>
      setState(() => goal.objectives = objectives));
  }

  void _createObjectives(Goal goal) {
    if(goal.objectives == null) {
      goal.objectives = List<Objective>();
      _getObjectives(goal);
    }
  }
}