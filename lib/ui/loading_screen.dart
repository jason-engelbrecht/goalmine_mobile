import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 40,
                              letterSpacing: 1.0))),
                  LinearProgressIndicator(),
                ])));
  }
}