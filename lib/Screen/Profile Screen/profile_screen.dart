import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/logout_dialog.dart';
import 'package:gowri_seva_sangam/Routes/app_pages.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Controller/profile_controller.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(ProfileController());
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: GetBuilder<ProfileController>(
        initState: (_) => ProfileController.to.initState(),
        builder: (va) => SafeArea(
          child : Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: GestureDetector(
                  onTap: () {
                    Get.dialog(
                            LogoutDialog(),
                          );
                  },
                  child: Center(
                    child: Text('Logout',
                      style: TextStyle(
                              fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary)
                      )),
                )),
              Column(
                children: [
                    SizedBox(width: Get.width * 20 / 896),
                    Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.userDetails.fullname ?? 'N/A', style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
                                                          color: Theme.of(context).colorScheme.surface,
                                                        )),
                                    Text(controller.userDetails.phone ?? 'N/A', style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                                                          color: Theme.of(context).colorScheme.surface,
                                                        )),
                                    Text(controller.userDetails.email ?? 'N/A', style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                                                          color: Theme.of(context).colorScheme.surface,
                                                        )),
                                  ],
                                ),
                                Container(
                                 height: Get.height * 65 / 896,
                                 width: Get.width * 65 / 414,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  //  border: Border.all(color: Theme.of(context).colorScheme.onSurface, width: 2.0),
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    controller.userDetails.profilePicture ?? 'assets/svg_icons/user_active.svg',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: SvgPicture.asset('assets/svg_icons/user_active.svg'),
                                      );
                                    },
                                  ),
                                ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Account',style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
                                                      color: Theme.of(context).colorScheme.surface,
                                                    )),
                      SizedBox(height: Get.height * 10 / 896),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.changePasswordView);
                        },
                        child: Card(
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg_icons/Password.svg'),
                                SizedBox(width: Get.width * 20 / 896),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Password',style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                                            color: Theme.of(context).colorScheme.surface,
                                                          )),
                                                          Text('Change Password',style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                                            color: Theme.of(context).colorScheme.surface,
                                                          ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(color: Theme.of(context).colorScheme.onSurface),
                      SizedBox(height: Get.height * 10 / 896),
                    ],
                  ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}