import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Controller/profile_controller.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => ChangePasswordViewState();
}

class ChangePasswordViewState extends State<ChangePasswordView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 0.0,
      ),
      resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              child: MaterialButton(
                height: Get.height * 45 / 896,
                minWidth: Get.width,
                onPressed: () async {
                  if (!controller.submitData.value) {
                    if (formKey.currentState!.validate()) {
                      controller.changePassword();
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).colorScheme.secondary,
                  ),
                    height: Get.height * 45 / 896,
                    width: Get.width,
                    child: Obx(() =>
                    Center(
                        child: controller.submitData.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).colorScheme.primaryContainer),
                              ),
                      ),
                    )),
              ),
            ),
          ),
        ),
        body: GetBuilder<ProfileController>(
          initState: (_) => ProfileController.to.initChangePasswordState(),
          builder: (value) => Column(
            children: [
              PrimaryGradiantContainer(
                radius: 18.0,
                onlyBottomRadius: true,
                height: 70.0,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          'assets/svg_icons/back_image.svg',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Poppins',
                            color: Theme.of(context).colorScheme.primaryContainer),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.0),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: Get.height * 30 / 896),
                                  CommonComponents.defaultTextFormField(
                                    context,
                                    title: 'Current Password',
                                    hintText: 'Enter current password',
                                    controller: controller.currentPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: controller.obscureOldText,
                                    // focusNode: s.isIOS ? focusNodes[0] : null,
                                    textInputAction: TextInputAction.next,
                                    suffixIcon: InkWell(
                                      overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                                      child: controller.obscureOldText
                                          ? const Icon(
                                              Icons.visibility_off_outlined,
                                              size: 15,
                                            )
                                          : const Icon(Icons.visibility_outlined, size: 15),
                                      onTap: () {
                                        controller.showOldPassword();
                                        // setState(() {
                                        //   isVisible = !isVisible;
                                        // });
                                      },
                                    ),
                                    validator: (val) {
                                      if (val == '') {
                                        return 'Please enter valid password';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: Get.height * 15 / 896),
                                  CommonComponents.defaultTextFormField(
                                    context,
                                    title: 'New Password',
                                    hintText: 'Enter new password',
                                    controller: controller.newPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.next,
                                    obscureText: controller.obscureNewText,
                                    // focusNode: Platform.isIOS ? focusNodes[1] : null,
                                    suffixIcon: InkWell(
                                      overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                                      child: controller.obscureNewText
                                          ? const Icon(
                                              Icons.visibility_off_outlined,
                                              size: 15,
                                            )
                                          : const Icon(
                                              Icons.visibility_outlined,
                                              size: 15,
                                            ),
                                      onTap: () {
                                        controller.showNewPassword();
                                        // setState(() {
                                        //   isVisible = !isVisible;
                                        // });
                                      },
                                    ),
                                    validator: (String? val) {
                                      if (val == '') {
                                        // controller.validpassword = false;
                                        // controller.showPasswordDialog = false;
                                        return 'Password is required';
                                      } else {
                                        // if (CommonService.instance.passwordPattern.hasMatch(val!)) {
                                        //   controller.validpassword = true;
                                        //   controller.showPasswordDialog = false;
                                        // } else {
                                        //   controller.validpassword = false;
                                        //   controller.showPasswordDialog = true;
                                        // }
                                        return null;
                                      }
                                    },
                                    onChange: (val) {
                                      controller.newPasswordController.text = val;
                                      controller.update();
                                    },
                                  ),
                                  SizedBox(height: Get.height * 15 / 896),
                                  CommonComponents.defaultTextFormField(
                                    context,
                                    title: 'Confirm New Password',
                                    hintText: 'Confirm new password',
                                    controller: controller.cnfrmNewPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    obscureText: controller.obscureCnfrmText,
                                    // focusNode: Platform.isIOS ? focusNodes[2] : null,
                                    suffixIcon: InkWell(
                                      overlayColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
                                      child: controller.obscureCnfrmText
                                          ? const Icon(
                                              Icons.visibility_off_outlined,
                                              size: 15,
                                            )
                                          : const Icon(
                                              Icons.visibility_outlined,
                                              size: 15,
                                            ),
                                      onTap: () {
                                        controller.showCnfrmPassword();
                                        // setState(() {
                                        //   isVisible = !isVisible;
                                        // });
                                      },
                                    ),
                                    validator: (val) {
                                      if (val == '') {
                                        return 'Please enter valid password';
                                      } else if (val != controller.newPasswordController.text) {
                                        return 'New password should match confirm password';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
              )
              // Padding(
              //   padding: EdgeInsets.only(top: Get.height * 144 / 896),
              //   child: Container(
              //     width: Get.width,
              //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Theme.of(context).colorScheme.primaryContainer),
              //     child: Column(
              //       children: [
              //         Expanded(
              //           child: Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 16),
              //             child: Form(
              //               key: formKey,
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.min,
              //                 children: [
              //                   SizedBox(height: Get.height * 30 / 896),
              //                   CommonComponents.defaultTextField(
              //                     context,
              //                     title: 'Current Password',
              //                     hintText: 'Enter current password',
              //                     controller: controller.currentPasswordController,
              //                     keyboardType: TextInputType.visiblePassword,
              //                     obscureText: controller.obscureOldText,
              //                     // focusNode: s.isIOS ? focusNodes[0] : null,
              //                     textInputAction: TextInputAction.next,
              //                     suffixIcon: InkWell(
              //                       overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
              //                       child: controller.obscureOldText
              //                           ? const Icon(
              //                               Icons.visibility_off_outlined,
              //                               size: 15,
              //                             )
              //                           : const Icon(Icons.visibility_outlined, size: 15),
              //                       onTap: () {
              //                         controller.showOldPassword();
              //                         // setState(() {
              //                         //   isVisible = !isVisible;
              //                         // });
              //                       },
              //                     ),
              //                     validator: (val) {
              //                       if (val == '') {
              //                         return 'Please enter valid password';
              //                       } else {
              //                         return null;
              //                       }
              //                     },
              //                   ),
              //                   Container(height: 20),
              //                   CommonComponents.defaultTextField(
              //                     context,
              //                     title: 'New Password',
              //                     hintText: 'Enter new password',
              //                     controller: controller.newPasswordController,
              //                     keyboardType: TextInputType.visiblePassword,
              //                     textInputAction: TextInputAction.next,
              //                     obscureText: controller.obscureNewText,
              //                     // focusNode: Platform.isIOS ? focusNodes[1] : null,
              //                     suffixIcon: InkWell(
              //                       overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
              //                       child: controller.obscureNewText
              //                           ? const Icon(
              //                               Icons.visibility_off_outlined,
              //                               size: 15,
              //                             )
              //                           : const Icon(
              //                               Icons.visibility_outlined,
              //                               size: 15,
              //                             ),
              //                       onTap: () {
              //                         controller.showNewPassword();
              //                         // setState(() {
              //                         //   isVisible = !isVisible;
              //                         // });
              //                       },
              //                     ),
              //                     validator: (String? val) {
              //                       if (val == '') {
              //                         // controller.validpassword = false;
              //                         // controller.showPasswordDialog = false;
              //                         return 'Password is required';
              //                       } else {
              //                         // if (CommonService.instance.passwordPattern.hasMatch(val!)) {
              //                         //   controller.validpassword = true;
              //                         //   controller.showPasswordDialog = false;
              //                         // } else {
              //                         //   controller.validpassword = false;
              //                         //   controller.showPasswordDialog = true;
              //                         // }
              //                         return null;
              //                       }
              //                     },
              //                     onChange: (val) {
              //                       controller.newPasswordController.text = val;
              //                       controller.update();
              //                     },
              //                   ),
              //                   Container(height: 20),
              //                   CommonComponents.defaultTextField(
              //                     context,
              //                     title: 'Confirm New Password',
              //                     hintText: 'Confirm new password',
              //                     controller: controller.cnfrmNewPasswordController,
              //                     keyboardType: TextInputType.visiblePassword,
              //                     textInputAction: TextInputAction.done,
              //                     obscureText: controller.obscureCnfrmText,
              //                     // focusNode: Platform.isIOS ? focusNodes[2] : null,
              //                     suffixIcon: InkWell(
              //                       overlayColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
              //                       child: controller.obscureCnfrmText
              //                           ? const Icon(
              //                               Icons.visibility_off_outlined,
              //                               size: 15,
              //                             )
              //                           : const Icon(
              //                               Icons.visibility_outlined,
              //                               size: 15,
              //                             ),
              //                       onTap: () {
              //                         controller.showCnfrmPassword();
              //                         // setState(() {
              //                         //   isVisible = !isVisible;
              //                         // });
              //                       },
              //                     ),
              //                     validator: (val) {
              //                       if (val == '') {
              //                         return 'Please enter valid password';
              //                       } else if (val != controller.newPasswordController.text) {
              //                         return 'New password should match confirm password';
              //                       } else {
              //                         return null;
              //                       }
              //                     },
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(height: Get.height * 20 / 896), // Add some bottom padding
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
