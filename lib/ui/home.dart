import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
      children: <Widget>[
        updateCard('Update 1', 'Some details'),
        updateCard('Update 2', 'Some details'),
      ]
    );
  }

  Widget updateCard(String title, String subtitle) {
    return Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Card(
            color: Theme.of(context).primaryColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
                contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 15),
                leading: Icon(Icons.update, size: 30, color: Colors.white),
                title: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 19))),
                subtitle: Text(subtitle,
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        fontSize: 15)),
                trailing: Icon(Icons.arrow_right, size: 30, color: Colors.white),
                onTap: () {
                  print('$title was tapped');
                }
              )));
  }
}