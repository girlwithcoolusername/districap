import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    this.title,
    this.body,
    this.wave,
    this.image,
  }) : super(key: key);
  final String? title, image, wave, body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          wave!,
          height: getProportionateScreenHeight(340),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
            padding: EdgeInsets.only(top: 10), // Add appropriate padding value
            child:Image.asset(
              image!,
              height: getProportionateScreenHeight(200),
              width: getProportionateScreenWidth(235),
            ),
        ),
        Text(
          title!,
          style: TextStyle(
            fontFamily: "assets/fonts/Mulish-Bold.tff",
            fontSize: getProportionateScreenWidth(20),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          body!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
