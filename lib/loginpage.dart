import 'package:checkin_project/signup.dart';
import 'package:checkin_project/widgets/inputfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'authentication.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "images/main_top.png",
                  // height: size.height * 0.2,
                  width: size.width * 0.3,
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "images/main_bottom.png",
                  height: size.height * 0.2,
                )),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        letterSpacing: 1.2,
                        fontSize: MediaQuery.textScaleFactorOf(context) * 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Image.asset(
                      "images/llogin.gif",
                      width: size.width,
                      fit: BoxFit.scaleDown,
                      height: size.height * 0.4,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08,
                        // vertical: size.width * 0.05
                      ),
                      child: Column(
                        children: [
                          InputField(
                              controller: email,
                              lable: "Email",
                              myicon: Icons.account_circle),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          InputField(
                            myicon: Icons.lock,
                            controller: password,
                            lable: "Password",
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                fixedSize: Size(size.width - size.width * 0.08,
                                    size.height * 0.07)),
                            onPressed: () {
                              signin(email.text, password.text, context);
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 19,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Do not have an Account?",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          15)),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              SignUpPage(),
                                        ));
                                  },
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              17)))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
