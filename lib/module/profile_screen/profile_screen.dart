import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/helper/shared_prefrence.dart';
import 'package:tezda_task/utils/app_route.dart';
import 'package:tezda_task/utils/app_strings.dart';
import 'package:tezda_task/utils/size_utils.dart';
import 'package:tezda_task/widget/custom_button.dart';
import 'package:tezda_task/widget/custom_text.dart';
import 'package:tezda_task/widget/detail_widget.dart';

class ProfileScreen extends StatelessWidget {
 const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          title: 'Profile',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  File(AppSharedPreference.profileImagePath ?? ''),
                  fit: BoxFit.cover,
                  height: SizeUtils.horizontalBlockSize * 40,
                  width: SizeUtils.horizontalBlockSize * 40,
                ),
              ),
            ),
            SizedBox(
              height: SizeUtils.verticalBlockSize * 5,
            ),
            DetailWidget(
              title: AppString.fullName,
              name: AppSharedPreference.userName ?? '',
            ),
            DetailWidget(
              title: AppString.email,
              name: AppSharedPreference.email ?? '',
            ),
            const Spacer(),
            CustomButton(
              title: AppString.logOut,
              onTap: () async {
             await AppSharedPreference.clear();
             Get.offAllNamed(Routes.loginScreen);
              },
              buttonColor: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
