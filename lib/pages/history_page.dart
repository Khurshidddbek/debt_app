import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  static final String id = 'history_page';

  const HistoryPage({ Key? key }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('History page'),),
    );
  }
}