import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tezda_task/helper/shared_prefrence.dart';
import 'package:tezda_task/helper/snackbar_helper.dart';
import 'package:tezda_task/utils/app_route.dart';
import 'package:tezda_task/utils/app_strings.dart';

class LoginServices {
  static var client = http.Client();

  static Future<void> registerUser(
      {required String email, required String password}) async {
    var data = {
      "email": email,
      "password": password,
    };
    log("message:- ${json.encode(data)}");
    var response = await client.post(
      Uri.parse(AppConfig.registerUser),
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      AppSnackBar.showErrorSnackBar(
          message: 'Registered Successfully', title: 'Success');
      Get.toNamed(Routes.loginScreen);
      return;
    } else {
      print('Error response:${response.body}');
    }

    return;
  }

  static Future<void> loginUser(
      {required String email, required String password}) async {
    var data = {
      "email": email,
      "password": password,
    };
    var response = await client.post(
      Uri.parse(AppConfig.registerUser),
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      await AppSharedPreference.setIsLogin(true);
      await AppSharedPreference.setEmail(email);
      AppSnackBar.showErrorSnackBar(
          message: 'Login Successfully', title: 'Success');
      Get.offAllNamed(Routes.addProfileScreen);
      return;
    } else {
      print('Error response:${response.body}');
    }

    return;
  }
}
