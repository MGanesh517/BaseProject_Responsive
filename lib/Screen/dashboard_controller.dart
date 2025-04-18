import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:get/get.dart';

class DashBoardControlelr extends GetxController {
  static DashBoardControlelr get to => Get.find();
  var commonService = CommonService.instance;

  int selectedIndex = 0;

}