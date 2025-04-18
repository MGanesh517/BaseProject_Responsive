import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Common%20Components/session_manager.dart';
import 'package:gowri_seva_sangam/Utils/web_device_id.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../Routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _initPackageInfo();

    _getId().then((id) {
      commonService.deviceId = id;
      commonService.deviceType = Platform.operatingSystem;
    });
    // ignore: prefer_const_constructors
    Timer(Duration(seconds: 3), () => isFirstUserOrNot());
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    commonService.packageInfo = info;
  }

  Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    debugPrint("deviceInfo :::: ${deviceInfo}");
    print('kisweb  :::: ${kIsWeb}');
    if (kIsWeb) {
      var webDeviceInfo = await deviceInfo.webBrowserInfo;
      debugPrint(
        "browserName :::: ${webDeviceInfo.browserName.name}",
      );
      debugPrint(
        "appCodeName :::: ${webDeviceInfo.appCodeName}",
      );
      debugPrint(
        "appName :::: ${webDeviceInfo.appName}",
      );
      debugPrint(
        "appVersion :::: ${webDeviceInfo.appVersion}",
      );
      debugPrint(
        "deviceMemory :::: ${webDeviceInfo.deviceMemory}",
      );
      debugPrint(
        "language :::: ${webDeviceInfo.language}",
      );
      debugPrint(
        "platform :::: ${webDeviceInfo.platform}",
      );
      debugPrint(
        "product :::: ${webDeviceInfo.product}",
      );
      debugPrint(
        "productSub :::: ${webDeviceInfo.productSub}",
      );
      debugPrint(
        "userAgent :::: ${webDeviceInfo.userAgent}",
      );
      debugPrint(
        "vendor :::: ${webDeviceInfo.vendor}",
      );
      debugPrint(
        "vendorSub :::: ${webDeviceInfo.vendorSub}",
      );
      debugPrint(
        "hardwareConcurrency :::: ${webDeviceInfo.hardwareConcurrency}",
      );
      debugPrint(
        "maxTouchPoints :::: ${webDeviceInfo.maxTouchPoints}",
      );

      final deviceId = DeviceId.getDeviceId();
      debugPrint('Device ID: $deviceId ');
      return deviceId;
    } else if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor!; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    } else {
      final deviceId = DeviceId.getDeviceId();
      debugPrint('Device ID: $deviceId ');
      return deviceId;
    }
  }

  var commonService = CommonService.instance;

  isFirstUserOrNot() async {
    commonService.accessToken = await SessionManager.getAccessToken();
    commonService.refreshToken = await SessionManager.getRefreshToken();
    commonService.username = await SessionManager.getUsername();
    // commonService.fullname = await SessionManager.getFullname();
    // commonService.userProfile = await SessionManager.getUserProfile();
    // commonService.userId = await SessionManager.getUserId();
    commonService.permissions = await SessionManager.getPermissions();
    // SessionManager.setIsFirstTime(true);
    // commonService.isFirstTime = await SessionManager.getIsFirstTime();
    debugPrint("isFirstUserOrNot :::::Access Token::::::${commonService.accessToken}");
    if (commonService.accessToken != '') {
      Get.toNamed(Routes.membersListScreen);
    } else {
      Get.toNamed(Routes.loginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 0.0),
    body: Center(
      child: PrimaryGradiantContainer(
                  onlyBottomRadius: false,
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/Absolin.svg', color: Colors.white),
                      SizedBox(height: Get.height * 20 / 896),
                      // SvgPicture.asset('assets/svg_icons/gowrisevasangamSmall.svg'),

                    ],
                  )
                ),
    ),
    );
  }
}