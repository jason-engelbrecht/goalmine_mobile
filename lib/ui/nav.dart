import 'dart:io';

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
  int _selectedIndex = 0;
  StudentService _studentService = StudentService();
  GoalService _goalService = GoalService();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    _createStudents();
    widget.parent.students.forEach((student) {
      _createGoals(student.id);
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

    if(widget.parent.students == null ||
       widget.parent.goals == null) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text('GoalMine',
                      style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                      letterSpacing: 1.0))),
                LinearProgressIndicator(),
              ])));
    }

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
        body: pages.elementAt(_selectedIndex),
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
        ], currentIndex: _selectedIndex, onTap: _onItemTapped));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _getStudents() {
    _studentService.getStudents(widget.parent.id).then((students) {
      setState(() {
        widget.parent.students = students;
      });
    });
  }

  void _createStudents() {
    if(widget.parent.students == null) {
      widget.parent.students = List<Student>();
      _getStudents();
    }
  }

  void _getGoals(int id) {
    _goalService.getGoals(id).then((goals) {
      setState(() {
        widget.parent.goals.addAll(goals);
      });
    });
  }

  void _createGoals(int id) {
    if(widget.parent.goals == null) {
      widget.parent.goals = List<Goal>();
      _getGoals(id);
    }
  }
}
