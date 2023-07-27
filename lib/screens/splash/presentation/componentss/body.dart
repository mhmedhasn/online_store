import 'package:calculator/screens/splash/presentation/componentss/splash_content.dart';
import 'package:calculator/screens/splash/presentation/provider/splash_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/default_button.dart';
import '../../../../config/routes/routes.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../size_config.dart';
import '../../../sign_in/presentation/pages/sign_in_screen.dart';

class BodySplash extends StatelessWidget {



  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Online store, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  BodySplash({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      builder: (context, child) {
        SplashProvider splashProvider = Provider.of<SplashProvider>(context);

        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      splashProvider.currentPageChange(value);
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      image: splashData[index]["image"],
                      text: splashData[index]['text'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      children: <Widget>[
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index: index, context: context),
                          ),
                        ),
                        const Spacer(flex: 3),
                        DefaultButton(
                          text: "Continue",
                          press: () {
                            Navigator.pushNamed(context, Routes.login);
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AnimatedContainer buildDot({int? index, required context}) {
    SplashProvider splashProvider = Provider.of<SplashProvider>(context);

    return AnimatedContainer(
      duration:Constants. kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: splashProvider.currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: splashProvider.currentPage == index
            ? AppColors.kPrimaryColor
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }


}
