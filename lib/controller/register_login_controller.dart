import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:tezda_task/helper/shared_prefrence.dart';
import 'package:tezda_task/helper/snackbar_helper.dart';
import 'package:tezda_task/service/login_service.dart';
import 'package:tezda_task/utils/app_route.dart';
import 'package:tezda_task/utils/app_strings.dart';

class RegisterLoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString test = ''.obs;
  RxBool isLogin = false.obs;

  @override
  Future<void> onInit() async {
    isLogin.value = AppSharedPreference.isLogin ?? false;
    if (isLogin.value) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Get.toNamed(Routes.productListingScreen);
      });
    }
    super.onInit();
  }

  Future<void> registerUser(String email, String password) async {
    try {
      await LoginServices.registerUser(email: email, password: password);
      // clear();
      update();
    } catch (e, st) {
      log("Error:$e  st :- $st");
    }
  }

  Future<void> userLogin(String email, String password) async {
    try {
      await LoginServices.loginUser(email: email, password: password);
      clear();
      update();
    } catch (e, st) {
      log("Error:$e  st :- $st");
    }
  }

   loginFunction() {
    if (emailController.value.text.isEmail &&
        passwordController.text.isNotEmpty) {
      userLogin(
          emailController.text.toString(), passwordController.text.toString());
    } else {
      AppSnackBar.showErrorSnackBar(
          message: AppString.emailText, title: 'Error');
    }
  }

  void registerFunction() {
    if (emailController.value.text.isEmail &&
        passwordController.text.isNotEmpty) {
      registerUser(
          emailController.text.toString(), passwordController.text.toString());
    } else {
      AppSnackBar.showErrorSnackBar(
          message: AppString.emailText, title: 'Error');
    }
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }
}
