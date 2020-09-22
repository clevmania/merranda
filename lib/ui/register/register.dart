import 'package:flutter/material.dart';
import 'package:merrand/size_config.dart';
import 'package:merrand/styles.dart';
import 'package:merrand/view/field_errors.dart';
import 'package:merrand/view/input_field_end_icon.dart';
import 'package:merrand/view/primary_button.dart';
import 'package:merrand/view/social_icons.dart';

import '../../constants.dart';

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
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Text("Register Account", style: headerStyle),
              SizedBox(
                height: 4,
              ),
              Text(
                "Complete your details or \ncontinue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              RegistrationForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIconCard(
                    iconName: "assets/icons/google-icon.svg",
                    iconTapped: () {},
                  ),
                  SocialIconCard(
                    iconName: "assets/icons/facebook-2.svg",
                    iconTapped: () {},
                  ),
                  SocialIconCard(
                    iconName: "assets/icons/twitter.svg",
                    iconTapped: () {},
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Text(
                "By Registering you confirm that you agree \n with our Terms and Condition",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String email, password, confirmPassword;
  final List<String> errors = [];

  void addError(String error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError(String error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          emailTextInputField(
              hint: "Enter your email",
              label: "Email",
              icon: "assets/icons/Mail.svg"),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          passwordTextInputField(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          confirmPasswordTextInputField(),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          TextInputError(errors: errors),
          PrimaryButton(
            text: "Register",
            buttonEvent: () {
              if (_formKey.currentState.validate()) {}
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
        if (value.isNotEmpty) {
          removeError(kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(kInvalidEmailError);
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

  TextFormField passwordTextInputField() {
    return TextFormField(
      obscureText: true,
      onSaved: (passwordValue) => password = passwordValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPassNullError);
        } else if (value.length >= 8) {
          removeError(kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(kShortPassError);
          return "";
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

  TextFormField confirmPasswordTextInputField() {
    return TextFormField(
      obscureText: true,
      onSaved: (cPValue) => confirmPassword = cPValue,
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(kMatchPassError);
        }
        // else if (value.length >= 8) {
        //   removeError(kShortPassError);
        // }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          // addError(kPassNullError);
          return "";
        } else if (password != confirmPassword) {
          addError(kMatchPassError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Re-enter Password",
        labelText: "Confirm Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: TextInputEndIcon(
          svgIconName: "assets/icons/Lock.svg",
        ),
      ),
    );
  }
}
