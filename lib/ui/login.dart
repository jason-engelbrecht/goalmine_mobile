import 'package:flutter/material.dart';
import 'package:goalmine_mobile/ui/nav.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State {
  final double formFieldPadding = 6.0;
  final double formMargin = 40.0;
  final double borderRadius = 10.0;
  final double letterSpacing = 2.0;

  String credentials = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.title;
    final Color primaryColorDark = Theme.of(context).primaryColorDark;

    return Scaffold(
        body: Form(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      header(primaryColorDark),
                      emailField(textStyle),
                      passwordField(textStyle),
                      loginButton(primaryColorDark)
                    ]))));
  }

  Widget header(Color primaryColorDark) {
    return Container(
      margin: EdgeInsets.only(bottom: formMargin),
      child: Text('GoalMine',
          style: TextStyle(
              fontSize: 50,
              color: primaryColorDark,
              fontWeight: FontWeight.w300)),
    );
  }

  Widget emailField(TextStyle textStyle) {
    return Padding(
        padding: EdgeInsets.only(bottom: formFieldPadding),
        child: TextField(
          controller: emailController,
          style: textStyle,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'EMAIL',
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
      height: 60,
      margin: EdgeInsets.only(top: formMargin),
      child: SizedBox.expand(
          child: RaisedButton(
            color: buttonColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            onPressed: () {
              print('Email: ${emailController.text}, '
                  'Password: ${passwordController.text}');
              navigateToHome();
            },
            child: Text('LOGIN',
              textScaleFactor: 1.3,
              style: TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w400),
            ),
      )),
    );
  }

  void navigateToHome() async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Nav()));
  }
}
