import 'dart:async';

import 'package:flutter_mvvm_demo/res/routes/routes_name.dart';
import 'package:flutter_mvvm_demo/view_model/controller/user_preferance/user_preferance_view_model.dart';
import 'package:get/get.dart';

class SplashService {
  UserPreference userPreference = UserPreference();
  void isLogin() {
    userPreference.getUser().then((value) {
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.loginScreen));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.homeScreen));
      }
    });
  }
}
