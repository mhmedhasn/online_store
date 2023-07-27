import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../size_config.dart';
class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Online store",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color:AppColors. kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(280),
          width: getProportionateScreenWidth(300),
        ),
      ],
    );
  }
}
