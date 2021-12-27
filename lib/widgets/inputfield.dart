import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  String? lable;

  TextEditingController? controller;
  IconData? myicon;
  bool? obscureText;
  InputField({
    this.controller,
    this.lable,
    this.myicon,
    this.obscureText,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText!,
      controller: widget.controller,
      // autofocus: true,
      cursorHeight: 26,
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: MediaQuery.textScaleFactorOf(context) * 18),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          label: Text(
            widget.lable!,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: MediaQuery.textScaleFactorOf(context) * 17),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          prefixIcon: Icon(
            widget.myicon,
            color: Theme.of(context).primaryColor,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: Theme.of(context).primaryColor.withOpacity(0.2)),
    );
  }
}
