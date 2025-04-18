import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';
import 'package:gowri_seva_sangam/Routes/app_pages.dart';
import 'package:gowri_seva_sangam/Screen/login/Controller/controller.dart';
class ChangePasswordSuccessMessageAlertDialog extends StatelessWidget {
  final Color? color;
  ChangePasswordSuccessMessageAlertDialog({super.key, this.color});
  // Future<bool> _willPopCallback() async {
  //   Get.back();

  //   return true;
  // }

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // var commonService = CommonService.instance;

    return PopScope(
      canPop: false,
      child: AlertDialog(
          contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          title: const Text(
            "Success...!",
            textAlign: TextAlign.center,
          ),
          content: const Text("Your password has been updated successfully. Now you will be redirected to login page.", textAlign: TextAlign.center),

          // content: const Text("You must be signed in to receive notifications, updates, and more.", textAlign: TextAlign.center),
          actions: [
            Row(
              children: [
                Flexible(
                  child: PrimaryGradiantContainer(
                    onlyBottomRadius: false, radius: 8,
                    // decoration: BoxDecoration(
                    //     gradient: LinearGradient(colors: [Color.fromRGBO(242, 83, 112, 1), Color.fromRGBO(140, 48, 65, 1)]),
                    //     borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                      height: Get.height * 45 / 896,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      // color: Colors.red,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(Routes.loginView);
                        Future.delayed(Duration.zero, () {
                          // SessionManager.setEmpCode('');
                          // SessionManager.setPassword('');
                          // SessionManager.setRememberMe(false);
                          loginController.logoutServiceCall(title: 'change password').then((val) {
                            // dashBoardController.changeTabIndex(0);
                          });
                        });
                      },
                      child: Center(
                          child: Text("Ok",
                              style: TextStyle(
                                fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ))),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
