
import 'package:flutter_mvvm_demo/view_model/controller/login/login_view_model.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(LoginViewModel(),permanent: true);
  }
}