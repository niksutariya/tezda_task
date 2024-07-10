import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/controller/register_login_controller.dart';
import 'package:tezda_task/module/login_screen/login_screen.dart';
import 'package:tezda_task/utils/app_icon.dart';
import 'package:tezda_task/utils/app_strings.dart';
import 'package:tezda_task/utils/size_utils.dart';
import 'package:tezda_task/widget/custom_text.dart';
import 'package:tezda_task/widget/email_field_widget.dart';
import 'package:tezda_task/widget/fade_animation_widget.dart';

class RegisterLoginScreen extends StatelessWidget {
  RegisterLoginScreen({super.key});

  final RegisterLoginController _registerLoginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          log('message :- ${_registerLoginController.test.value}');
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 45,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: -SizeUtils.verticalBlockSize * 5,
                        height: SizeUtils.verticalBlockSize * 48,
                        width: SizeUtils.screenWidth,
                        child: FadeAnimationWidget(
                          duration: const Duration(seconds: 1),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      AppIcon.backGround1),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        height: SizeUtils.verticalBlockSize * 48,
                        width: SizeUtils.screenWidth + 20,
                        child: FadeAnimationWidget(
                          duration: const Duration(seconds: 1),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      AppIcon.backGround2),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimationWidget(
                        duration: const Duration(milliseconds: 1500),
                        child: CustomText(
                          title: AppString.signUp,
                          color: const Color.fromRGBO(49, 39, 79, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: SizeUtils.fSize_30(),
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.verticalBlockSize * 5,
                      ),
                      FadeAnimationWidget(
                        duration: const Duration(milliseconds: 1700),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromRGBO(196, 135, 198, .3)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(196, 135, 198, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ],
                          ),
                          child: EmailFieldWidget(
                            emailController:
                                _registerLoginController.emailController,
                            passwordController:
                                _registerLoginController.passwordController,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.verticalBlockSize * 5,
                      ),
                      FadeAnimationWidget(
                        duration: const Duration(milliseconds: 1900),
                        child: MaterialButton(
                          onPressed: _registerLoginController.registerFunction,
                          color: const Color.fromRGBO(49, 39, 79, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.verticalBlockSize * 4,
                      ),
                      FadeAnimationWidget(
                        duration: const Duration(milliseconds: 2000),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomText(title: AppString.haveAccount),
                            InkWell(
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                              child: const CustomText(
                                title: AppString.login,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Register Post API"),
    //     centerTitle: true,
    //   ),
    //   body: Obx(
    //     () {
    //       log('message :- ${_registerLoginController.test.value}');
    //       return Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             TextFormField(
    //               controller: _registerLoginController.emailController,
    //               decoration: const InputDecoration(hintText: "Email"),
    //             ),
    //             const SizedBox(height: 20),
    //             TextFormField(
    //               controller: _registerLoginController.passwordController,
    //               decoration: const InputDecoration(hintText: "Password"),
    //             ),
    //             const SizedBox(height: 30),
    //             GestureDetector(
    //               onTap: () {
    //                 _registerLoginController.registerUser(
    //                     _registerLoginController.emailController.text
    //                         .toString(),
    //                     _registerLoginController.passwordController.text
    //                         .toString());
    //               },
    //               child: Container(
    //                 height: 50,
    //                 width: double.infinity,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: Colors.blue,
    //                 ),
    //                 child: const Center(
    //                   child: Text(
    //                     "Register",
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
