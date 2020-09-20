import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../size_config.dart';

class TextInputError extends StatelessWidget {
  const TextInputError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length, (index) => inputError(errors[index])
      )
    );
  }
}

Row inputError(String error) {
  return Row(
    children: [
      SvgPicture.asset(
        "assets/icons/Error.svg",
        height: getProportionateScreenHeight(14),
        width: getProportionateScreenWidth(14),
      ),
      SizedBox(
        width: getProportionateScreenWidth(10),
      ),
      Text(error),
    ],
  );
}