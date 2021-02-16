import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySettingsPage extends StatefulWidget{
  MySettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySettingsPageState createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Settings')
            ]
        ),
      ),
    );
  }
}