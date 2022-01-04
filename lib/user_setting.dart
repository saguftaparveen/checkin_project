import 'package:checkin_project/authentication.dart';
import 'package:checkin_project/user_home.dart';
import 'package:flutter/material.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({Key? key}) : super(key: key);

  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Stored latitude: ${latitude}"),
            SizedBox(height: 10),
            Text("Stored longitude: ${longitude}"),
            SizedBox(height: 10),
            Text("Current latitude: ${current_latitude}"),
            SizedBox(height: 10),
            Text("Current longitude: ${current_longitude}"),
            SizedBox(height: 10),
            Text("Distance: ${distancebetween}"),
            SizedBox(height: 10),
            Text("Required Range: 0.00310686"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
