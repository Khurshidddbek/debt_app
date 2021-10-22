import 'package:flutter/material.dart';
import 'package:qarz_app/pages/Authentication/registration_page.dart';
import 'package:qarz_app/pages/create_page.dart';
import 'package:qarz_app/pages/home_page.dart';
import 'package:qarz_app/pages/settings_page.dart';
import 'package:qarz_app/pages/Authentication/signin_page.dart';
import 'package:qarz_app/pages/Authentication/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your debt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
      routes: {
        // Authentication
        RegistrationPage.id: (context) => RegistrationPage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),

        // Home
        HomePage.id: (context) => HomePage(),
        CreatePage.id: (context) => CreatePage(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }
}