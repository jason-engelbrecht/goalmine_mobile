import 'package:flutter/material.dart';
import 'package:goalmine_mobile/ui/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GoalMine',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: Login());
  }
}
