import 'package:flutter/material.dart';
import 'package:merrand/size_config.dart';
import 'package:merrand/view/field_errors.dart';
import 'package:merrand/view/input_field_end_icon.dart';
import 'package:merrand/view/primary_button.dart';

import '../../constants.dart';
import '../../styles.dart';

class Profile extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: ProfileLayout(),
    );
  }
}

class ProfileLayout extends StatefulWidget {
  @override
  _ProfileLayoutState createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Text(
                "Update Profile",
                style: headerStyle,
              ),
              Text(
                "Complete your profile in less than 2 minutes \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              ProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String firstname, lastname, mobile, address;

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
          firstNameField(
              hint: "First Name", label: "Name", icon: "assets/icons/User.svg"),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          lastNameField(
              hint: "Last Name", label: "Name", icon: "assets/icons/User.svg"),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          phoneField(
              hint: "Phone Number",
              label: "Phone",
              icon: "assets/icons/Phone.svg"),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          addressField(
              hint: "House Address",
              label: "Address",
              icon: "assets/icons/Location point.svg"),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          TextInputError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          PrimaryButton(
            text: "Update",
            buttonEvent: () {
              if (_formKey.currentState.validate()) {}
            },
          ),
        ],
      ),
    );
  }

  TextFormField firstNameField({String hint, String label, String icon}) {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (savedValue) => firstname = savedValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kNamelNullError);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(kNamelNullError);
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

  TextFormField lastNameField({String hint, String label, String icon}) {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (savedValue) => lastname = savedValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kLastNameNullError);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(kLastNameNullError);
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

  TextFormField phoneField({String hint, String label, String icon}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (savedValue) => mobile = savedValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPhoneNumberNullError);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(kPhoneNumberNullError);
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

  TextFormField addressField({String hint, String label, String icon}) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (savedValue) => address = savedValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kAddressNullError);
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(kAddressNullError);
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
