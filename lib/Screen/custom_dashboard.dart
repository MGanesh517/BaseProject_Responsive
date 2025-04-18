import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Routes/app_pages.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/community_members_list.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/profile_screen.dart';
import 'package:gowri_seva_sangam/Screen/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  DashboardViewState createState() => DashboardViewState();
}

class DashboardViewState extends State<DashboardView> {
  final controller = Get.put(DashBoardControlelr());
  final commonService = CommonService.instance;

  final List<Widget> screens = [
    MembersList(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) {
    if (index < screens.length) {
      setState(() {
        controller.selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: screens[controller.selectedIndex],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          height: Get.height * 0.1,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.16),
                spreadRadius: 5,
                blurRadius: 19.6,
                offset: const Offset(0, 8),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildNavItem(
                selectedIcon: 'assets/svg_icons/member_list_active.svg',
                unselectedIcon: 'assets/svg_icons/member_list_inactive.svg',
                index: 0,
                text: 'Members'
              ),

              Flexible(
                child: Container(
                  padding: EdgeInsets.only(bottom: 3),
                  height: Get.height * 52 / 896,
                  width: Get.width * 52 / 414,
                  child: FittedBox(
                    child: FloatingActionButton(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        Get.toNamed(Routes.addMembers);
                      },
                      child: SvgPicture.asset('assets/svg_icons/add.svg'),
                    ),
                  ),
                ),
              ),

              _buildNavItem(
                selectedIcon: 'assets/svg_icons/user_active.svg',
                unselectedIcon: 'assets/svg_icons/user_inactive.svg',
                index: 1,
                text: '   Profile  '
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String selectedIcon,
    required String unselectedIcon,
    required int index,
    required String text
    }) {
    bool isSelected = controller.selectedIndex == index;
  return Flexible(
    child: GestureDetector(
      onTap: () {
        onItemTapped(index)   ;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            // onTap: () => onItemTapped(index),
            child: SvgPicture.asset(isSelected ? selectedIcon : unselectedIcon, height: 24)), // Adjust icon size
          const SizedBox(height: 2), // Reduce gap between icon & text
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                color: Theme.of(context).colorScheme.surface,
                overflow: TextOverflow.ellipsis,
              ),
          ),
        ],
      ),
    ),
  );
}
}