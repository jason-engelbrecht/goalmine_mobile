import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/services/parent_service.dart';
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
  ParentService parentService = ParentService();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

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
                      getUsername(2)
                    ],
                  )),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: false,
                secondary: const Icon(Icons.lightbulb_outline),
                onChanged: (changed) => print('dark mode')
              ),
              ListTile(
                leading: Icon(Icons.lock_open),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
        body: <Widget>[Goals(parent: widget.parent),
                       Students(parent: widget.parent)]
                          .elementAt(selectedIndex),
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

  FutureBuilder<Parent> getUsername(int id) =>
      FutureBuilder<Parent>(
        future: parentService.getParent(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return Text('${snapshot.data.username}',
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ));
          else
            return Padding(
              padding: EdgeInsets.all(10),
              child: LinearProgressIndicator()
            ) ;
        });

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
