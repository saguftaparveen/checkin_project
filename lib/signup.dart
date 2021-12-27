import 'package:checkin_project/loginpage.dart';
import 'package:checkin_project/widgets/inputfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authentication.dart';
import '../home.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    // Text(
                    //   "Sign Up",
                    //   style: TextStyle(
                    //     letterSpacing: 1.2,
                    //     fontSize: MediaQuery.textScaleFactorOf(context) * 23,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                    Image.asset(
                      "images/logo.png",
                      // width: size.width,
                      // fit: BoxFit.fill,
                      height: size.height * 0.2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08,
                        // vertical: size.width * 0.05
                      ),
                      child: Column(
                        children: [
                          InputField(
                            controller: username,
                            lable: "User Name",
                            myicon: Icons.account_circle_outlined,
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
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
                                primary: Color(0xfff99820),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                fixedSize: Size(size.width - size.width * 0.08,
                                    size.height * 0.07)),
                            onPressed: () {
                              signup(email.text, password.text, context);
                            },
                            child: Text(
                              "Sign Up",
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
                              Text("Already Have an Account?",
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
                                            LoginPage(),
                                      ));
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            17,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
