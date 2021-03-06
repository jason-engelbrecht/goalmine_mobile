import 'package:flutter/material.dart';
import 'package:goalmine_mobile/models/parent.dart';
import 'package:goalmine_mobile/services/parent_service.dart';
import 'package:goalmine_mobile/ui/nav.dart';
import 'package:goalmine_mobile/ui/loading_screen.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final double _formFieldPadding = 6.0;
  final double _formMargin = 40.0;
  final double _borderRadius = 10.0;
  final double _letterSpacing = 2.0;
  final primaryColor = Colors.red[400];

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  ParentService _parentService = ParentService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.title;

    if(isLoading) {
      return LoadingScreen();
    }

    return Scaffold(
        body: Form(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildHeader(),
                      _buildUsernameField(textStyle),
                      _buildPasswordField(textStyle),
                      _buildLoginButton()
                    ]))));
  }

  Widget _buildHeader() => Container(
        margin: EdgeInsets.only(bottom: _formMargin),
        child: Text('GoalMine',
            style: TextStyle(
                fontSize: 50,
                color: primaryColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0)),
      );

  Widget _buildUsernameField(TextStyle textStyle) => Padding(
      padding: EdgeInsets.only(bottom: _formFieldPadding),
      child: TextField(
        controller: _usernameController,
        style: textStyle,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'USERNAME',
            labelStyle: TextStyle(
                fontSize: 17.5,
                letterSpacing: _letterSpacing,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius))),
      ));

  Widget _buildPasswordField(TextStyle textStyle) => Padding(
      padding:
          EdgeInsets.only(top: _formFieldPadding, bottom: _formFieldPadding),
      child: TextField(
        controller: _passwordController,
        style: textStyle,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
                fontSize: 17.5,
                letterSpacing: _letterSpacing,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius))),
      ));

  Widget _buildLoginButton() => Container(
      height: 57.5,
      margin: EdgeInsets.only(top: _formMargin),
      child: SizedBox.expand(
          child: RaisedButton(
            color: primaryColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_borderRadius)),
            child: Text(
              'LOGIN',
              textScaleFactor: 1.3,
              style: TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w400),
            ),
            onPressed: () => _login(),
      )));

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if(username.isNotEmpty && password.isNotEmpty) {
      setState(() => isLoading = true);
      _parentService.authLogin(username, password).then((parent) {
        if(parent != null) {
          _navigateToHome(parent);
        }
        else {
          setState(() => isLoading = false);
          _showErrorDialog("Username and password did not match.");
        }
      });
    }
    else {
      _showErrorDialog("Please enter something.");
    }
  }

  void _navigateToHome(Parent parent) async {
    await Navigator.push(
        context, PageRouteBuilder(
        transitionDuration: Duration(seconds: 0),
        pageBuilder: (context, animation, animation2) => Nav(parent: parent)));
  }

  Future<void> _showErrorDialog(String errorMsg) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Login'),
          content: Text(errorMsg, style: TextStyle(fontSize: 17.5)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius)));
      },
    );
  }
}
