import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo/urils/utils.dart';
import 'package:flutter_mvvm_demo/view_model/controller/login/login_view_model.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginVM = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    TextFormField(
                      controller: loginVM.emailController.value,
                      focusNode: loginVM.emailFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.toastMessage("Enter Email");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.feildFocusChange(
                            context,
                            loginVM.emailFocusNode.value,
                            loginVM.passwordFocusNode.value);
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter email",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
            TextFormField(
              controller: loginVM.passwordController.value,
              focusNode: loginVM.passwordFocusNode.value,
              validator: (value) {
                if (value!.isEmpty) {
                  Utils.toastMessage("Enter password");
                }
                return null;
              },
              onFieldSubmitted: (value) {
                Utils.feildFocusChange(
                    context,
                    loginVM.emailFocusNode.value,
                    loginVM.passwordFocusNode.value);
              },
              decoration: const InputDecoration(
                  hintText: "Enter password",
                  border: OutlineInputBorder()),
            ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginVM.loginApi();
                    }
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
