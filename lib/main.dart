import 'package:flutter/material.dart';
import 'package:goalmine_mobile/services/service.dart';
import 'package:goalmine_mobile/ui/login.dart';
import 'package:provider/provider.dart';

import 'dark_mode/dark_mode.dart';
import 'dark_mode/dark_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  Service service = Service();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    service.openConnection();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              title: 'GoalMine',
              home: Login());
          },
        ),);
  }

  @override
  void dispose() {
    super.dispose();
    service.closeConnection();
  }
}
