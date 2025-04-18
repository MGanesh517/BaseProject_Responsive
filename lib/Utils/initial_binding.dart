import 'package:gowri_seva_sangam/Screen/login/Controller/controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    // Get.put<RetailersController>(RetailersController(), permanent: true);
    // Get.put<CartController>(CartController(), permanent: true);
  }
}
