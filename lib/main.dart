import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qarz_app/pages/create_page.dart';
import 'package:qarz_app/pages/home_page.dart';
import 'package:qarz_app/pages/settings_page.dart';
import 'package:qarz_app/pages/signin_page.dart';
import 'package:qarz_app/pages/signup_page.dart';
import 'package:qarz_app/services/prefs_service.dart';

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
      home: SignInPage(),
      routes: {
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
        HomePage.id: (context) => HomePage(),
        CreatePage.id: (context) => CreatePage(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }
}