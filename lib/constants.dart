List<Map<String, String>> getSliderData() {
  return [
    {
      "text": "Welcome to Tokoyo, Let's shop",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help users connect to stores \nIn the United States, Europe & China",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Shopping made easy. \nJust stay at home, we got this!!..",
      "image": "assets/images/splash_3.png"
    }
  ];
}

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kLastNameNullError = "Please Enter your last name";

const String otpHeaderBody = "Enter the code that was sent to \n+234805****982";

const String ForgotPasswordHeader =
    "Please enter your email to receive a link \nwhich brings you back to your account";
