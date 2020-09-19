import 'package:flutter/material.dart';
import 'package:merrand/color.dart';
import 'package:merrand/constants.dart';
import 'package:merrand/size_config.dart';
import 'package:merrand/view/primary_button.dart';
import 'onboard_slider.dart';

class Onboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: OnboardLayout(),
    );
  }
}

class OnboardLayout extends StatefulWidget {
  @override
  _OnboardLayoutState createState() => _OnboardLayoutState();
}

class _OnboardLayoutState extends State<OnboardLayout> {
  int currentPage = 0;
  List<Map<String, String>> sliderBody = getSliderData();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: sliderBody.length,
                  itemBuilder: (context, index) => SliderArea(
                        text: sliderBody[index]['text'],
                        image: sliderBody[index]['image'],
                      )),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)
                  ),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(sliderBody.length,
                            (index) => sliderIndicator(index: index)),
                      ),
                      Spacer(flex: 3),
                      PrimaryButton(
                        text: "Continue",
                        buttonEvent: () {},
                      ),
                      Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  AnimatedContainer sliderIndicator({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0XFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
