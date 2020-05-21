import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/goal.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/models/student.dart';
import 'package:goalmine_mobile/services/goal_service.dart';
import 'package:goalmine_mobile/services/student_service.dart';
import 'package:goalmine_mobile/ui/goals.dart';
import 'package:goalmine_mobile/ui/students.dart';

class Nav extends StatefulWidget {
  final Parent parent;
  const Nav({Key key, this.parent}) : super(key : key);

  @override
  State<StatefulWidget> createState() => NavState();
}

class NavState extends State<Nav> {
  int selectedIndex = 0;
  StudentService studentService = StudentService();
  GoalService goalService = GoalService();

  void getStudents() {
    studentService.getStudents(widget.parent.id).then((students) {
      setState(() {
        widget.parent.students = students;
      });
    });
  }

  void createStudents() {
    if(widget.parent.students == null) {
      widget.parent.students = List<Student>();
      getStudents();
    }

    widget.parent.students.forEach((student) {
      print(student.firstName);
    });
  }

  void getGoals(int id) {
    goalService.getGoals(id).then((goals) {
      setState(() {
        widget.parent.goals = goals;
      });
    });
  }

  void createGoals(int id) {
    if(widget.parent.goals == null) {
      widget.parent.goals = List<Goal>();
      getGoals(id);
    }
    widget.parent.goals.forEach((goal) {
      print(goal.goalDescription);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    createStudents();
    widget.parent.students.forEach((student) {
      createGoals(student.id);
    });

    List<Widget> pages = [
      Goals(
          parent: widget.parent,
          students: widget.parent.students,
          goals: widget.parent.goals),
      Students(
          parent: widget.parent,
          students: widget.parent.students)
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                        child: Text('GoalMine',
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
                title: Text('Dark Mode'),
                value: false,
                secondary: Icon(Icons.lightbulb_outline),
                onChanged: (changed) => print('dark mode')
              ),
              ListTile(
                leading: Icon(Icons.lock_open),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
        body: pages.elementAt(selectedIndex),
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
