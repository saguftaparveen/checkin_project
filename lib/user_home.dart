import 'package:flutter/material.dart';
import 'package:checkin_project/location.dart';
import 'package:geolocator/geolocator.dart';

class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

var address = "hi";

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  shagufta();
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff99820),
              ),
              child: Text("Checkin")),
          Text(address)
        ],
      ),
    );
  }
}

shagufta() async {
  Position position = await getGeoLocationPosition();
  String location = 'Lat: ${position.latitude} , Long: ${position.longitude}';

  address = await GetAddressFromLatLong(position);

  print(address);
}
