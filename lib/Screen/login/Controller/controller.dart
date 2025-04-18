import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_loading_widget.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_snackbar.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Common%20Components/session_manager.dart';
import 'package:gowri_seva_sangam/Routes/app_pages.dart';
import 'package:gowri_seva_sangam/Screen/login/Model/login_post_model.dart';
import 'package:gowri_seva_sangam/Screen/login/Repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  var commonService = CommonService.instance;

  // final miniController = Get.put(MiniController());

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RxBool _obscureText = true.obs;
  get obscureText => _obscureText.value;
  set obscureText(value) => _obscureText.value = value;

  final RxBool _loginButtonEnable = false.obs;
  get loginButtonEnable => _loginButtonEnable.value;
  set loginButtonEnable(value) => _loginButtonEnable.value = value;

  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userNameController.clear();
      passwordController.clear();
      loginButtonEnable = false;
      obscureText = true;
    });
  }

  loginServiceCall() async {
    Login mobileOTPVerifyObj = Login();
    mobileOTPVerifyObj.username = userNameController.text;
    mobileOTPVerifyObj.otp = passwordController.text;
    mobileOTPVerifyObj.apnsToken = commonService.apnsToken ?? '';
    mobileOTPVerifyObj.pushToken = commonService.pushToken ?? '';
    // final userdata = Hive.box<UserLoginData>("userData");
    showLoadingDialog();
    try {
      final data = await LoginRepo().login(mobileOTPVerifyObj.username, mobileOTPVerifyObj.otp, commonService.deviceId, commonService.deviceName,
          commonService.deviceType, mobileOTPVerifyObj.pushToken, mobileOTPVerifyObj.apnsToken);

      closeLoadingDialog();
      if (data != null) {
        // Get.back();
        commonService.accessToken = data.tokens != null && data.tokens!.access != null ? data.tokens!.access ?? '' : '';
        commonService.refreshToken = data.tokens != null && data.tokens!.refresh != null ? data.tokens!.refresh ?? '' : '';
        commonService.username = data.fullName ?? '';
        commonService.userEmail = data.email ?? '';
        commonService.userMobile = data.phone ?? '';
        commonService.userProfile = data.groupName ?? '';
        commonService.userId = data.id ?? '';

        SessionManager.setAccessToken(data.tokens != null && data.tokens!.access != null ? data.tokens!.access ?? '' : '');
        SessionManager.setRefreshToken(data.tokens != null && data.tokens!.refresh != null ? data.tokens!.refresh ?? '' : '');
        SessionManager.setUsername(data.fullName ?? '');
        SessionManager.setUserProfile(data.groupName ?? '');
        SessionManager.setUserEmail(data.email ?? '');
        SessionManager.setUserMobile(data.phone ?? '');
        SessionManager.setUserId(data.id ?? '');
        SessionManager.setIsFirstTime(true);
        // SocketUtils.socketLogin();
        commonService.isFirstTime = await SessionManager.getIsFirstTime();

        await getPermissions();
        userNameController.clear();
        passwordController.clear();
        // SocketUtils.socketLogin();
        // miniController.miniProductTypeIsRefresh = true;
        // await miniController.getMiniProductTypeList();

        await Get.toNamed(Routes.membersListScreen);

        return true;
      } else {
        showSnackBar(
          title: "login..! Failed",
          message: 'Incorrect OTP, Please try again',
          icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
        );
        debugPrint("Api Error Response error:: ");
        return false;
      }
    } catch (e) {
      debugPrint(
        "user login error: $e",
      );
      showSnackBar(
        title: "login..! Failed",
        message: e.toString(),
        icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
      );
      closeLoadingDialog();
      rethrow;
    }
  }

  logoutServiceCall({String? title}) async {
    showLoadingDialog();
    try {
      await LoginRepo().userLogout(commonService.refreshToken, commonService.deviceId, commonService.deviceType).then((value) async {
        print('SplashScreen accessToken: $value');
        if (value) {
          commonService.accessToken = '';
          commonService.refreshToken = '';
          commonService.username = '';
          commonService.fullname = '';
          commonService.userId = '';

          SessionManager.setAccessToken('');
          SessionManager.setRefreshToken('');
          SessionManager.setUsername('');
          SessionManager.setFullname('');
          SessionManager.setPermissions(['']);
          SessionManager.setUserId('');
          // SocketUtils.socketLogout();
          debugPrint("SplashScreen accessToken: ${commonService.accessToken}");
          debugPrint("SplashScreen refreshToken: ${commonService.refreshToken}");
          debugPrint("SplashScreen username: ${commonService.username}");
          debugPrint("SplashScreen fullname: ${commonService.fullname}");
          debugPrint("SplashScreen userid: ${commonService.userId}");
        }

        if (title == 'logout') {
          showSnackBar(
            title: "logout..! Success",
            message: 'You have been successfully logged out.',
            icon: const Icon(Icons.check_circle_outline, color: Colors.green),
          );
        }
        closeLoadingDialog();
        await Get.toNamed(Routes.loginView);
        // homeController.(0);
        update();
      });
    } catch (e) {
      closeLoadingDialog();
      showSnackBar(
        title: "logout..! Failed",
        message: "Please try again",
        icon: const Icon(Icons.close, color: Colors.red),
      );
    }
  }

  getPermissions() async {
    try {
      await LoginRepo().getPermissions().then((value) async {
        if (value != null) {
          SessionManager.setPermissions(List<String>.from(await value));
          commonService.permissions = List<String>.from(await value);
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}
