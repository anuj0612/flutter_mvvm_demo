import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo/view/login_screen.dart';
import 'package:flutter_mvvm_demo/view_model/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    super.initState();
    splashService.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(child: Text("welcome")),
    );
  }
}
