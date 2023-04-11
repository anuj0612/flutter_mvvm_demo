import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo/res/routes/routes.dart';
import 'package:flutter_mvvm_demo/urils/binding.dart';
import 'package:flutter_mvvm_demo/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter MVVM Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

