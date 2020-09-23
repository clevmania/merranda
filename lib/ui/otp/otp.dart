import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merrand/color.dart';
import 'package:merrand/constants.dart';
import 'package:merrand/view/primary_button.dart';

import '../../size_config.dart';
import '../../styles.dart';

class Otp extends StatelessWidget {
  static String routeName = '/otp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: OtpLayout(),
    );
  }
}

class OtpLayout extends StatefulWidget {
  @override
  _OtpLayoutState createState() => _OtpLayoutState();
}

class _OtpLayoutState extends State<OtpLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                ),
                Text(
                  "Verify Pin",
                  style: headerStyle,
                ),
                Text(
                  otpHeaderBody,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pin expires in "),
                    TweenAnimationBuilder(
                      tween: Tween(begin: 120.0, end: 0),
                      duration: Duration(minutes: 2),
                      builder: (context, value, child) => Text(
                        duration(value),
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      onEnd: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                ),
                PinView(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String duration(value) {
    var min = (value.toInt() / 60).toInt() % 60;
    var seconds = (value.toInt() % 60);
    var sec = (seconds < 10) ? "0$seconds" : "$seconds";
    return '$min:$sec';
  }
}

class PinView extends StatefulWidget {
  @override
  _PinViewState createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  FocusNode pin2, pin3, pin4;

  @override
  void initState() {
    super.initState();
    pin2 = FocusNode();
    pin3 = FocusNode();
    pin4 = FocusNode();
  }

  @override
  void dispose() {
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
    super.dispose();
  }

  void nextPin({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextPin(value: value, focusNode: pin2);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin2,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextPin(value: value, focusNode: pin3);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin3,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextPin(value: value, focusNode: pin4);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin4,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    pin4.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
          ),
          PrimaryButton(
            text: "Continue",
            buttonEvent: () {},
          )
        ],
      ),
    );
  }
}
