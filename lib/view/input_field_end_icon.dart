import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class TextInputEndIcon extends StatelessWidget {
  const TextInputEndIcon({
    Key key, this.svgIconName,
  }) : super(key: key);

  @required final String svgIconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIconName,
        height: getProportionateScreenHeight(18),
      ),
    );
  }
}