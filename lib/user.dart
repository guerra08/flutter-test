import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String username = "";
  GithubData githubData;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bio from Github')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(githubData == null || githubData.bio == null ? 'Find a user' : 'Bio: ${githubData.bio}'),
            Container(
              width: 180,
              child: TextField(
                onChanged: (value) => setState(() => username = value),
              ),
            ),
            isLoading
                ? SpinKitRotatingCircle(
                    color: Colors.red,
                    size: 50.0,
                  )
                : ElevatedButton(
                    onPressed: getUserDataFromGithub, child: Text('Find'))
          ],
        ),
      ),
    );
  }

  void getUserDataFromGithub() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get('https://api.github.com/users/$username');
    setState(() {
      isLoading = false;
      githubData = (response.statusCode == 200)
          ? GithubData.fromJson(jsonDecode(response.body))
          : null;
    });
  }
}

class GithubData {
  final String bio;

  GithubData({this.bio});

  factory GithubData.fromJson(Map<String, dynamic> json) {
    return GithubData(bio: json['bio']);
  }
}
