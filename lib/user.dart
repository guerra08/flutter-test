import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyUserPage extends StatefulWidget{
  MyUserPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyUserPageState createState() => _MyUserPageState();
}

class _MyUserPageState extends State<MyUserPage> {
  String _username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'User',
            ),
          ],
        ),
      ),
    );
  }
}