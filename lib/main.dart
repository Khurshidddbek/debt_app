import 'package:flutter/material.dart';
import 'package:qarz_app/model/contact_model.dart';
import 'package:qarz_app/pages/Authentication/registration_page.dart';
import 'package:qarz_app/pages/add_debt_page.dart';
import 'package:qarz_app/pages/contacts_page.dart';
import 'package:qarz_app/pages/create_contact_page.dart';
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
      home: RegistrationPage(),
      routes: {
        // Authentication
        RegistrationPage.id: (context) => RegistrationPage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),

        // Home
        HomePage.id: (context) => HomePage(),
        CreateContactPage.id: (context) => CreateContactPage(),
        SettingsPage.id: (context) => SettingsPage(),
        ContactsPage.id: (context) => ContactsPage(),
        AddDebtPage.id: (context) => AddDebtPage(
              contact: Contact(avatar: '', fullname: '', id: ''),
            ),
      },
    );
  }
}
