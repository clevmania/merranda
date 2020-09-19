import 'package:flutter/material.dart';
import 'package:merrand/size_config.dart';
import 'package:merrand/color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key key, this.text, this.buttonEvent,
  }) : super(key: key);
  final String text;
  final Function buttonEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        onPressed: buttonEvent,
        child: Text(
          text,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white),
        ),
      ),
    );
  }
}