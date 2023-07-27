import 'package:calculator/screens/category_details/presentation/pages/details_screen.dart';
import 'package:calculator/screens/details/details_screen.dart';
import 'package:calculator/screens/forgot_password/forgot_password_screen.dart';
import 'package:calculator/screens/otp/otp_screen.dart';
import 'package:calculator/screens/sign_in/presentation/pages/sign_in_screen.dart';
import 'package:calculator/screens/sign_up/sign_up_screen.dart';
import 'package:calculator/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/components.dart';
import '../../screens/cart/cart_screen.dart';
import '../../screens/home/domain/entities/CategoriesEntity.dart';
import '../../screens/home/domain/entities/ProductEntity.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/home/presenation/components/fav_tab/brand_selected.dart';
import '../../screens/login_success/login_success_screen.dart';
import '../../screens/sign_in/data/data_sources/data_sources.dart';

class Routes {
  static const String splash = "/";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String home = "homeScreen";
  static const String productDetails = "productDetails";
  static const String cart = "cart";
  static const String brandSelected = "brandSelected";
  static const String loginSuccessScreen = "loginSuccessScreen";
  static const String otpScreen = "OtpScreen";
  static const String forgotPasswordScreen = "forgotPasswordScreen";
  static const String detailsScreen = "detailsScreen";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );
      case Routes.productDetails:
    ProductDataEntity productDataEntity = routeSettings.arguments as ProductDataEntity;
        return MaterialPageRoute(

          builder: (context) => CategoryDetailsScreen(productDataEntity),
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordScreen(),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case Routes.home:
        // LoginEntity loginEntity = routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      // case Routes.productDetails:
      //       //   ProductDataEntity productEntity =
      //       //   routeSettings.arguments as ProductDataEntity;
      //       //   return MaterialPageRoute(
      //       //     builder: (context) => ProductDetails(productEntity),
      //       //   );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (context) =>  CartScreen(),
        );
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) =>  SplashScreen(),
        );
      case Routes.detailsScreen:
        DataEntity dataEntity = routeSettings.arguments as DataEntity;
        return MaterialPageRoute(
          builder: (context) => DetailsScreen(dataEntity),
        );
      case Routes.brandSelected:
       BrandsArguments arguments =routeSettings.arguments as BrandsArguments;
        return MaterialPageRoute(
          builder: (context) => BrandSelected(arguments: arguments,)
        );
      case Routes.loginSuccessScreen:
        return MaterialPageRoute(
          builder: (context) => LoginSuccessScreen(),
        );

      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}
