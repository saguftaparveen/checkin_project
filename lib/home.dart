import 'package:checkin_project/authentication.dart';
import 'package:checkin_project/loginpage.dart';
import 'package:checkin_project/user_home.dart';
import 'package:checkin_project/user_setting.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItem = 0;

  List<Widget> _widgetOptions = [
    UserHome(),
    UserSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () async {
                  await signout().then((value) =>
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      )));
                },
                child: Text(
                  "SignOut",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: _selectedItem,
        selectedItemColor: Color(0xfff99820),
        onTap: _onItemTap,
      ),
      body: _widgetOptions.elementAt(_selectedItem),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}
