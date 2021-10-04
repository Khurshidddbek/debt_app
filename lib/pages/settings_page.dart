import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static final String id = 'settings_page';

  const SettingsPage({ Key? key }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Settings page'),),
    );
  }
}