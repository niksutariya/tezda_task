import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tezda_task/helper/shared_prefrence.dart';
import 'package:tezda_task/helper/snackbar_helper.dart';
import 'package:tezda_task/utils/app_route.dart';
import 'package:tezda_task/utils/app_strings.dart';

class ProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  static final ImagePicker _picker = ImagePicker();
  RxString imagePathSet = "".obs;
  File file = File("");

  Future pickImageFromGallery() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    imagePathSet.value = image?.path.toString() ?? '';
    file = File(image?.path ?? '');
    await AppSharedPreference.setProfileImagePath(imagePathSet.value);
  }

  Future onTapNextFunction() async {
    if (nameController.text.isNotEmpty && imagePathSet.value.isNotEmpty) {
      await AppSharedPreference.setUserName(nameController.text);
      Get.offAllNamed(Routes.productListingScreen);
    } else {
      AppSnackBar.showErrorSnackBar(
          message: AppString.nameMessage, title: 'Error');
    }
  }
}
