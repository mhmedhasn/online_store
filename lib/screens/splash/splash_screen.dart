
import 'package:calculator/screens/splash/presentation/componentss/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: BodySplash(),
    );
  }
}
