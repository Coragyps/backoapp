import 'package:backoapp/screens/detailed_screen.dart';
import 'package:backoapp/screens/feed_screen.dart';
import 'package:backoapp/screens/home_screen.dart';
import 'package:backoapp/screens/menu_screen.dart';
import 'package:backoapp/screens/onboarding_screen.dart';
import 'package:backoapp/screens/search_screen.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static const initialRoute = 'onBoardingScreen';
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoute = {};

    appRoute.addAll({
      "detailedScreen":(BuildContext context) => const DetailedScreen()
    });

    appRoute.addAll({
      "feedScreen":(BuildContext context) => const FeedScreen()
    });

    appRoute.addAll({
      "homeScreen":(BuildContext context) => const HomeScreen()
    });

    appRoute.addAll({
      "menuScreen":(BuildContext context) => const MenuScreen()
    });

    appRoute.addAll({
      "onBoardingScreen":(BuildContext context) => const OnBoardingScreen()
    });

    appRoute.addAll({
      "searchScreen":(BuildContext context) => const SearchScreen()
    });

    return appRoute;
  }
}