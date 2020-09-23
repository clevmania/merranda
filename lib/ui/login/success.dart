import 'package:flutter/material.dart';
import 'package:merrand/size_config.dart';
import 'package:merrand/ui/home/home.dart';
import 'package:merrand/view/primary_button.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congratulations"),
      ),
      body: LoginSuccessLayout(),
    );
  }
}

class LoginSuccessLayout extends StatefulWidget {
  @override
  _LoginSuccessLayoutState createState() => _LoginSuccessLayoutState();
}

class _LoginSuccessLayoutState extends State<LoginSuccessLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.08,
          ),
          Text(
            "Login Successful, \nYou'll be redirected shortly",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(23),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenHeight * 0.4,
            child: PrimaryButton(
              text: "Continue to Home",
              buttonEvent: () {
                Navigator.pushNamed(context, Home.routeName);
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
