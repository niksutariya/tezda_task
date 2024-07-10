import 'package:get/get.dart';
import 'package:tezda_task/controller/register_login_controller.dart';

class AppBidding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterLoginController());
  }
}