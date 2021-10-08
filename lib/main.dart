import 'package:flutter/material.dart';
import 'package:qarz_app/pages/create_page.dart';
import 'package:qarz_app/pages/home_page.dart';
import 'package:qarz_app/pages/main_page.dart';
import 'package:qarz_app/pages/settings_page.dart';
import 'package:qarz_app/pages/signin_page.dart';
import 'package:qarz_app/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      routes: {
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        MainPage.id: (context) => MainPage(),
        HomePage.id: (context) => HomePage(),
        CreatePage.id: (context) => CreatePage(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }
}
