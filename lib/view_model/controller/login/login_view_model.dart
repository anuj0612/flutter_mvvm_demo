import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_demo/models/login/user_model.dart';
import 'package:flutter_mvvm_demo/res/routes/routes_name.dart';
import 'package:flutter_mvvm_demo/view_model/controller/user_preferance/user_preferance_view_model.dart';
import 'package:get/get.dart';

import '../../../repository/login_repository/login_repository.dart';
import '../../../urils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  UserPreference userPreference = UserPreference();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value["error"] == "user not found") {
        Utils.toastMessage("Login: User not find");
      } else {
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true
        );
        userPreference
            .saveUser(userModel)
            .then((value) {
              Get.toNamed(RoutesName.homeScreen);
        })
            .onError((error, stackTrace) {});
        Utils.toastMessage(
          "Login: Login Successfully",
        );
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.toastMessage(
        "Login: ${error}",
      );
    });
  }
}
