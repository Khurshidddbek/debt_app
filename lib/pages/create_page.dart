import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({ Key? key }) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Create page'),),
    );
  }
}