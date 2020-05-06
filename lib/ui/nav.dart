import 'package:flutter/material.dart';
import 'package:goalmine_mobile/ui/home.dart';
import 'package:goalmine_mobile/ui/students.dart';

class Nav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavState();
}

class NavState extends State {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[Home(), Students()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Welcome Back, Jason',
              style: TextStyle(color: Theme.of(context).primaryColorDark)),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Center(
            child: widgetOptions.elementAt(selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
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