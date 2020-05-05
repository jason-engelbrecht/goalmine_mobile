import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State {
  double formPadding = 6.0;
  String credentials = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    Color primaryColorDark = Theme.of(context).primaryColorDark;

    return Form(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  header(primaryColorDark),
                  emailField(textStyle),
                  passwordField(textStyle),
                  loginButton(primaryColorDark),
                  Text(credentials)
                ])));
  }

  Padding header(Color primaryColorDark) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text('GoalMine',
          style: TextStyle(
              fontSize: 50.0,
              color: primaryColorDark
          )),
    );
  }

  Padding emailField(TextStyle textStyle) {
    return Padding(
        padding: EdgeInsets.only(top: formPadding, bottom: formPadding),
        child: TextField(
          controller: emailController,
          style: textStyle,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: textStyle,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ));
  }

  Padding passwordField(TextStyle textStyle) {
    return Padding(
        padding: EdgeInsets.only(top: formPadding, bottom: formPadding),
        child: TextField(
          controller: passwordController,
          style: textStyle,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: textStyle,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ));
  }

  Container loginButton(Color primaryColorDark) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 15),
      child: SizedBox.expand(
          child: RaisedButton(
            color: primaryColorDark,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                credentials = 'Email: ${emailController.text}, '
                    'Password: ${passwordController.text}';
              });
            },
            child: Text('LOGIN',
              textScaleFactor: 1.5,
              style: TextStyle(
                letterSpacing: 1.5,
              ),
            ),
          )),
    );
  }
}
