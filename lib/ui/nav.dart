import 'package:flutter/material.dart';
import 'package:goalmine_mobile/ui/goals.dart';
import 'package:goalmine_mobile/ui/students.dart';

class Nav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavState();
}

class NavState extends State {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[Goals(), Students()];

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('GoalMine',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  letterSpacing: 1.0)),
          automaticallyImplyLeading: false
        ),
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.timeline),
                title: Text('Goals'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                title: Text('Students'),
              )],
            currentIndex: selectedIndex,
            onTap: onItemTapped));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}