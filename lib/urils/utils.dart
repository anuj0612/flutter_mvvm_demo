import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_demo/res/colors/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: AppColor.blackColor);
  }
}
