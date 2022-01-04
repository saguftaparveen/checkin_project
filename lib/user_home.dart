import 'package:checkin_project/authentication.dart';
import 'package:checkin_project/user_setting.dart';
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
var current_latitude;
var current_longitude;
var distancebetween;

class _UserHomeState extends State<UserHome> {
  @override
  void initState() {
    getLatLangfromDB();
    shagufta();

    super.initState();
  }

  shagufta() async {
    Position position = await getGeoLocationPosition();
    // String location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    display = await FirebaseAuth.instance.currentUser!.displayName.toString();
    address = await GetAddressFromLatLong(position);
    current_latitude = position.latitude;
    current_longitude = position.longitude;
    print("current: ${current_latitude}");
    print(current_longitude);
    print(latitude);
    print(longitude);
    print(address);
    distancebetween = Geolocator.distanceBetween(
            latitude, longitude, current_latitude, current_longitude) *
        0.000621371;
    print(distancebetween);
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
                if (distancebetween < 0.00310686) {
                  checkin(address, context);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Out of range")));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff99820),
              ),
              child: Text("Checkin")),
          Text(address),
          Text(display),
          ElevatedButton(
              onPressed: () {
                checkout(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff99820),
              ),
              child: Text("Check Out")),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Refresh"))
        ],
      ),
    );
  }
}
