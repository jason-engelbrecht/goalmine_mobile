import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State {
  double formPadding = 5.0;
  String credentials = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Form(
        child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text('GoalMine',
                        style: TextStyle(
                            fontSize: 50.0,
                          color: Theme.of(context).primaryColorDark
                        )),
                  ),

                  Padding(
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
                      )),

                  Padding(
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
                      )),

                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        onPressed: () {
                          setState(() {
                            credentials = 'Email: ${emailController.text}, '
                                'Password: ${passwordController.text}';
                          });
                        },
                        child: Text(
                          'Login',
                          textScaleFactor: 2.0,
                        ),
                      )),

                  Text(credentials)
                ])));
  }
}
