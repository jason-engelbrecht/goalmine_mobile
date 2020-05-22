import 'package:flutter/material.dart';
import 'package:goalmine_mobile/dark_mode/dark_mode.dart';
import 'package:goalmine_mobile/models/goal.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/models/student.dart';
import 'package:goalmine_mobile/services/goal_service.dart';
import 'package:goalmine_mobile/services/student_service.dart';
import 'package:goalmine_mobile/ui/goals.dart';
import 'package:goalmine_mobile/ui/students.dart';
import 'package:provider/provider.dart';

class Nav extends StatefulWidget {
  final Parent parent;

  const Nav({Key key, this.parent}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NavState();
}

class NavState extends State<Nav> {
  int selectedIndex = 0;
  StudentService studentService = StudentService();
  GoalService goalService = GoalService();
  List<Student> students;
  List<Goal> goals;

  void getStudents() {
    studentService.getStudents(widget.parent.id).then((newStudents) {
      setState(() {
        students = newStudents;
      });
    });
  }

  void createStudents() {
    if (students == null) {
      students = List<Student>();
      getStudents();
    }

    students.forEach((student) {
      print(student.firstName);
    });
  }

  void getGoals() {
    goalService.getGoals(1).then((newGoals) {
      setState(() {
        goals = newGoals;
      });
    });
  }

  void createGoals() {
    if (goals == null) {
      goals = List<Goal>();
      getGoals();
    }
    goals.forEach((goal) {
      print(goal.goalDescription);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final Color primaryColor = Theme.of(context).primaryColor;
    createStudents();
    createGoals();

    return Scaffold(
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 0),
                blurRadius: 3.0,
              )
            ]),
            child: AppBar(
              iconTheme: new IconThemeData(color: Colors.red),
              title: Text('GoalMine',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      letterSpacing: 1.0)),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
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
        body: <Widget>[
          Goals(parent: widget.parent, students: students, goals: goals),
          Students(parent: widget.parent, students: students)
        ].elementAt(selectedIndex),
        bottomNavigationBar:
            BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            title: Text('Goals'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Students'),
          )
        ], currentIndex: selectedIndex, onTap: onItemTapped));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
