import 'package:flutter_mvvm_demo/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(UserModel loginModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", loginModel.token.toString());
    sp.setBool("isLogin", true);
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    bool? isLogin = sp.getBool("isLogin");
    return UserModel(token: token,isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
