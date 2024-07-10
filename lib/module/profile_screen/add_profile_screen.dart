import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/controller/profile_controller.dart';
import 'package:tezda_task/helper/shared_prefrence.dart';
import 'package:tezda_task/helper/snackbar_helper.dart';
import 'package:tezda_task/utils/app_icon.dart';
import 'package:tezda_task/utils/app_route.dart';
import 'package:tezda_task/utils/app_strings.dart';
import 'package:tezda_task/utils/size_utils.dart';
import 'package:tezda_task/widget/custom_button.dart';
import 'package:tezda_task/widget/custom_text.dart';
import 'package:tezda_task/widget/detail_widget.dart';

class AddProfileScreen extends StatelessWidget {
  AddProfileScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(
          title: 'Profile',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () {
                    log(profileController.imagePathSet.value);
                    return Center(
                      child: profileController.imagePathSet.value == ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                               AppString.noImagePlaceholder,
                                fit: BoxFit.cover,
                                height: SizeUtils.horizontalBlockSize * 40,
                                width: SizeUtils.horizontalBlockSize * 40,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(profileController.imagePathSet.value),
                                fit: BoxFit.cover,
                                height: SizeUtils.horizontalBlockSize * 40,
                                width: SizeUtils.horizontalBlockSize * 40,
                              ),
                            ),
                    );
                  },
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 5,
                ),
                CustomText(
                  title: AppString.fullName,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeUtils.fSize_14(),
                  color: Colors.black.withOpacity(0.8),
                  lineHeight: 2.0,
                ),
                TextField(
                  controller: profileController.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: AppString.fullName,
                  ),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 3,
                ),
                DetailWidget(
                  title: AppString.email,
                  name: AppSharedPreference.email ?? '',
                ),
                const Spacer(),
                CustomButton(
                  title: AppString.next,
                  onTap: ()  {
                    profileController.onTapNextFunction();
                  },
                  buttonColor: Colors.blue,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            right: SizeUtils.horizontalBlockSize * 30,
            top: SizeUtils.horizontalBlockSize * 34,
            child: GestureDetector(
              onTap: () {
                profileController.pickImageFromGallery();
              },
              child: Image.asset(
                AppIcon.edit,
                scale: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
