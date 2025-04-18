import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_loading_widget.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_snackbar.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Model/user_model.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Repo/profile_repo.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Widgets/change_password.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  var commonService = CommonService.instance;

  initChangePasswordState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      obscureOldText = true;
      obscureNewText = true;
      obscureCnfrmText = true;
    });
  }
  
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getUserDetails();
      update();
    });
  }
  

  final _userDetails = GetUserProfileData().obs;
  GetUserProfileData get userDetails => _userDetails.value;
  set userDetails(value) => _userDetails.value = value;

  getUserDetails() async {
    showLoadingDialog();
    try {
      closeLoadingDialog();

      final data = await ProfileRepo().getUserDetails();
      if (data != null) {
        closeLoadingDialog();
        _userDetails.value = data;

        update();
      } else {
        debugPrint("Api Error Response error:: ");
        closeLoadingDialog();
        return false;
      }
    } catch (e) {
      closeLoadingDialog();

      debugPrint("Api  Response error:: $e ");
      rethrow;
    }
  }

  final RxBool _obscureOldText = true.obs;
  get obscureOldText => _obscureOldText.value;
  set obscureOldText(value) => _obscureOldText.value = value;

  final RxBool _obscureNewText = true.obs;
  get obscureNewText => _obscureNewText.value;
  set obscureNewText(value) => _obscureNewText.value = value;

  final RxBool _obscureCnfrmText = true.obs;
  get obscureCnfrmText => _obscureCnfrmText.value;
  set obscureCnfrmText(value) => _obscureCnfrmText.value = value;

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController cnfrmNewPasswordController = TextEditingController();

  showOldPassword() {
    obscureOldText = !obscureOldText;
    update();
  }

  showNewPassword() {
    obscureNewText = !obscureNewText;
    update();
  }

  showCnfrmPassword() {
    obscureCnfrmText = !obscureCnfrmText;
    update();
  }

  final RxBool _submitData = false.obs;
  RxBool get submitData => _submitData;
  set submitData(value) => _submitData.value = value;

  changePassword() async {
    submitData = true;
    print('passwords are ${currentPasswordController.text},${newPasswordController.text}');
    var passwordObj = jsonEncode({"old_password": currentPasswordController.text, "password": newPasswordController.text});

    try {
      final data = await ProfileRepo().changePassword(passwordObj);

      if (data) {
        submitData = false;
        currentPasswordController.clear();
        newPasswordController.clear();
        cnfrmNewPasswordController.clear();

        Get.dialog(
          ChangePasswordSuccessMessageAlertDialog(),
        );

        // showSnackBar(
        //   title: "Success...!",
        //   message: "Password hass been updated successfully",
        //   icon: const Icon(Icons.check_circle_outline, color: Colors.green),
        // );

        // Get.toNamed(Routes.loginView);

        return true;
      } else {
        showSnackBar(
          title: "Oops..!",
          message: 'Incorrect old password',
          icon: const Icon(Icons.close, color: Colors.red),
        );
        debugPrint("Api Error Response error:: ");
        return false;
      }
    } catch (e) {
      submitData = false;
      showSnackBar(
        title: "Oops..!",
        message: 'Incorrect old password',
        icon: const Icon(Icons.close, color: Colors.red),
      );

      return false;
    }
  }
}
