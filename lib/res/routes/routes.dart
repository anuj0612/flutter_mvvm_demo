import 'package:flutter_mvvm_demo/res/routes/routes_name.dart';
import 'package:flutter_mvvm_demo/view/home_screen.dart';
import 'package:flutter_mvvm_demo/view/login_screen.dart';
import 'package:flutter_mvvm_demo/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
    GetPage(
        name: RoutesName.loginScreen,
        page: () => const LoginScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)),
    GetPage(
        name: RoutesName.homeScreen,
        page: () => const HomeActivity(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)),
      ];
}
