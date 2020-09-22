import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  static String routeName = "/register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: RegisterLayout(),
    );
  }
}

class RegisterLayout extends StatefulWidget {
  @override
  _RegisterLayoutState createState() => _RegisterLayoutState();
}

class _RegisterLayoutState extends State<RegisterLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
