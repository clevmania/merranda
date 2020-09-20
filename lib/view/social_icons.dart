import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class SocialIconCard extends StatelessWidget {
  const SocialIconCard({
    Key key,
    this.iconName,
    this.iconTapped,
  }) : super(key: key);

  final String iconName;
  final Function iconTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: iconTapped,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0XFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(iconName),
      ),
    );
  }
}