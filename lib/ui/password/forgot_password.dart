import 'package:flutter/material.dart';
import 'package:merrand/constants.dart';
import 'package:merrand/size_config.dart';
import 'package:merrand/view/field_errors.dart';
import 'package:merrand/view/input_field_end_icon.dart';
import 'package:merrand/view/primary_button.dart';

import '../../color.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = '/forgotPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: ForgotPasswordLayout(),
    );
  }
}

class ForgotPasswordLayout extends StatefulWidget {
  @override
  _ForgotPasswordLayoutState createState() => _ForgotPasswordLayoutState();
}

class _ForgotPasswordLayoutState extends State<ForgotPasswordLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(28),
                ),
              ),
              Text(
                ForgotPasswordHeader,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              ForgotPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email, password;
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
            height: getProportionateScreenHeight(20),
          ),
          TextInputError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          PrimaryButton(
            text: "Continue",
            buttonEvent: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, ForgotPassword.routeName),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
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
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
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
}
