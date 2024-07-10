import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/controller/register_login_controller.dart';
import 'package:tezda_task/module/login_screen/register_login_screen.dart';
import 'package:tezda_task/utils/app_icon.dart';
import 'package:tezda_task/utils/app_strings.dart';
import 'package:tezda_task/utils/size_utils.dart';
import 'package:tezda_task/widget/custom_text.dart';
import 'package:tezda_task/widget/email_field_widget.dart';
import 'package:tezda_task/widget/fade_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final RegisterLoginController _registerLoginController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                              image: AssetImage(AppIcon.backGround1),
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
                              image: AssetImage(AppIcon.backGround2),
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
                      title: AppString.login,
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
                      onPressed: _registerLoginController.loginFunction,
                      color: const Color.fromRGBO(49, 39, 79, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: const Center(
                        child: CustomText(
                          title:AppString.login,
                          color: Colors.white,
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
                        const CustomText(title: AppString.doNotHaveAccount),
                        InkWell(
                          onTap: () {
                            Get.to(RegisterLoginScreen());
                          },
                          child: const CustomText(
                            title: AppString.signUp,
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
      ),
    );
  }
}
