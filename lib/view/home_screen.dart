import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo/res/routes/routes_name.dart';
import 'package:flutter_mvvm_demo/view_model/controller/user_preferance/user_preferance_view_model.dart';
import 'package:get/get.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  UserPreference userPreference = UserPreference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RoutesName.loginScreen);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
