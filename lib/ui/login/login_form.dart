import 'package:flutter/material.dart';
import 'package:merrand/view/field_errors.dart';
import 'package:merrand/view/input_field_end_icon.dart';
import 'package:merrand/view/primary_button.dart';

import '../../color.dart';
import '../../constants.dart';
import '../../size_config.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email, password;
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailTextInputField(
              hint: "Enter your email",
              label: "Email",
              icon: "assets/icons/Mail.svg"),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          passwordTextInputField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              Checkbox(
                  value: rememberMe,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  }),
              Text("Remember me"),
              Spacer(),
              Text(
                "Forgot Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
          TextInputError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          PrimaryButton(
            text: "Continue",
            buttonEvent: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField emailTextInputField({String hint, String label, String icon}) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (savedValue) => email = savedValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: TextInputEndIcon(
          svgIconName: icon,
        ),
      ),
    );
  }

  TextFormField passwordTextInputField() {
    return TextFormField(
      obscureText: true,
      onSaved: (passwordValue) => password = passwordValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter Password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: TextInputEndIcon(
          svgIconName: "assets/icons/Lock.svg",
        ),
      ),
    );
  }
}