import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tezda_task/app_binding.dart';
import 'package:tezda_task/utils/app_route.dart';
import 'package:tezda_task/utils/app_strings.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      initialBinding: AppBidding(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: child,
          ),
        );
      },
      initialRoute: Routes.loginScreen,
      getPages: Routes.pages,
      navigatorKey: Get.key,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
