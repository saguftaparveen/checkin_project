import 'package:checkin_project/authentication.dart';
import 'package:checkin_project/loginpage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () async {
          await signout().then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginPage(),
              )));
        },
        child: Text(
          'Logout',
        ),
      ),
    );
  }
}
