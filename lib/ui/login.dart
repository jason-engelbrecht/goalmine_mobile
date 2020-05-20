import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/services/parent_service.dart';
import 'package:goalmine_mobile/services/student_service.dart';
import 'package:goalmine_mobile/ui/nav.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final double formFieldPadding = 6.0;
  final double formMargin = 40.0;
  final double borderRadius = 10.0;
  final double letterSpacing = 2.0;

  String credentials = '';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ParentService parentService = ParentService();

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
        body: Form(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      header(Colors.red[400]),
                      usernameField(textStyle),
                      passwordField(textStyle),
                      loginButton(Colors.red[400])
                    ]))));
  }

  Widget header(Color primaryColor) {
    return Container(
      margin: EdgeInsets.only(bottom: formMargin),
      child: Text('GoalMine',
          style: TextStyle(
              fontSize: 50,
              color: primaryColor,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.0)),
    );
  }

  Widget usernameField(TextStyle textStyle) {
    return Padding(
        padding: EdgeInsets.only(bottom: formFieldPadding),
        child: TextField(
          controller: usernameController,
          style: textStyle,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'USERNAME',
              labelStyle: TextStyle(
                  fontSize: 17.5,
                  letterSpacing: letterSpacing,
                  fontWeight: FontWeight.w400
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius))),
        ));
  }

  Widget passwordField(TextStyle textStyle) {
    return Padding(
        padding: EdgeInsets.only(top: formFieldPadding, bottom: formFieldPadding),
        child: TextField(
          controller: passwordController,
          style: textStyle,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'PASSWORD',
              labelStyle: TextStyle(
                fontSize: 17.5,
                letterSpacing: letterSpacing,
                fontWeight: FontWeight.w400
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius))),
        ));
  }

  Widget loginButton(Color buttonColor) {
    return Container(
      height: 57.5,
      margin: EdgeInsets.only(top: formMargin),
      child: SizedBox.expand(
          child: RaisedButton(
            color: buttonColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            onPressed: () {
              login();
            },
            child: Text('LOGIN',
              textScaleFactor: 1.3,
              style: TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w400),
            ),
      )),
    );
  }

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if(username.isNotEmpty && password.isNotEmpty) {
      parentService.authLogin(username, password).then((parentID) {
        if(parentID > 0) {
          parentService.getParent(parentID).then((parent) {
            navigateToHome(parent);
          });
        }
        else {
          //validation
        }
      });
    }
    else {
      //validation
    }
  }

  void navigateToHome(Parent parent) async {
    //Parent parent = Parent(id: 1, username: 'g', isActive: true);

    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Nav(parent: parent)));
  }
}
