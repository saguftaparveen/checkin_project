import 'package:checkin_project/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:checkin_project/location.dart';
import 'package:geolocator/geolocator.dart';

class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

var address = "";
var display = "";

class _UserHomeState extends State<UserHome> {
  @override
  void initState() {
    shagufta();
    super.initState();
  }

  shagufta() async {
    Position position = await getGeoLocationPosition();
    String location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    display = await FirebaseAuth.instance.currentUser!.displayName.toString();
    address = await GetAddressFromLatLong(position);

    print(address);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                checkin(address);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff99820),
              ),
              child: Text("Checkin")),
          Text(address),
          Text(display),
          ElevatedButton(
              onPressed: () {
                checkout();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff99820),
              ),
              child: Text("Check Out")),
        ],
      ),
    );
  }
}
