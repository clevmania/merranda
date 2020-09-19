import 'package:merrand/color.dart';
import 'package:flutter/material.dart';
import 'package:merrand/size_config.dart';

class SliderArea extends StatelessWidget {
  const SliderArea({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "TOKOYO",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text, textAlign: TextAlign.center,),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}