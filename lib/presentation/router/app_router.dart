import 'package:flutter/material.dart';
import 'package:magedsoft/constants/page_const.dart';
import 'package:magedsoft/presentation/layout/home_layout.dart';
import 'package:magedsoft/presentation/view/help.dart';
import 'package:magedsoft/presentation/view/login.dart';
import 'package:magedsoft/presentation/view/otp.dart';
import 'package:magedsoft/presentation/view/product_details.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case otp:
        return MaterialPageRoute(builder: (_) => OTPPage());
      case layout:
        return MaterialPageRoute(builder: (_) => HomeLayout());
      case help:
        return MaterialPageRoute(builder: (_) => HelpPage());
      case laptopDetails:
        return MaterialPageRoute(

            builder: (_)
    {
    List<dynamic> arg = settings.arguments as List<dynamic>;
      return DetailsPage(networkImage: arg[0], text: arg[1], company: arg[2], price: arg[3], name: arg[4], type: arg[5]);
    }
    );

      default:
        return null;
    }
  }
}