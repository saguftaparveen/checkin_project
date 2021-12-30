import 'package:checkin_project/authentication.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final _formkey = GlobalKey<FormState>();

  final subjectController = TextEditingController();
  final reasonController = TextEditingController();
  final durationController = TextEditingController();

  var subject = "";
  var reason = "";
  var duration = "";

  @override
  void dispose() {
    subjectController.dispose();
    reasonController.dispose();
    durationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: subjectController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please provide some subject";
                  }
                },
                // autofocus: true,
                cursorHeight: 26,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.textScaleFactorOf(context) * 18),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text(
                      "Subject",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.textScaleFactorOf(context) * 17),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.2)),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                controller: reasonController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please provide some reason";
                  }
                },

                // autofocus: true,
                cursorHeight: 26,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.textScaleFactorOf(context) * 18),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text(
                      "Reason",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.textScaleFactorOf(context) * 17),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.2)),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              TextFormField(
                controller: durationController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please provide some duration";
                  }
                },

                // autofocus: true,
                cursorHeight: 26,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: MediaQuery.textScaleFactorOf(context) * 18),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    label: Text(
                      "Duration",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.textScaleFactorOf(context) * 17),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.2)),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xfff99820),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    fixedSize: Size(
                        size.width - size.width * 0.08, size.height * 0.07)),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      subject = subjectController.text;
                      reason = reasonController.text;
                      duration = durationController.text;
                    });
                    request_form(context, subject, reason, duration);
                    setState(() {
                      clear_form();
                    });
                  }
                },
                child: Text(
                  "Request",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: MediaQuery.of(context).textScaleFactor * 19,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void clear_form() {
    subject = "";
    reason = "";
    duration = "";
    durationController.clear();
    subjectController.clear();
    reasonController.clear();
  }
}
