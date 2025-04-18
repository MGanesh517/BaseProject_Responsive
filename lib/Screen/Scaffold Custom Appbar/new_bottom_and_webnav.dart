// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
// import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
// import 'package:gowri_seva_sangam/Routes/app_pages.dart';
// import 'package:gowri_seva_sangam/Screen/Community_Members/community_members_list.dart';
// import 'package:gowri_seva_sangam/Screen/Profile%20Screen/profile_screen.dart';

// class NavigationItemCommon {
//   final String selectedIcon;
//   final String unselectedIcon;
//   final String label;
//   final Function() onTap;

//   NavigationItemCommon({
//     required this.selectedIcon,
//     required this.unselectedIcon,
//     required this.label,
//     required this.onTap,
//   });
// }

// class DashboardController extends GetxController {
//   RxInt selectedIndex = 0.obs;
//   final commonService = CommonService.instance;

//   final List<NavigationItemCommon> navigationItems = [
//     NavigationItemCommon(
//       selectedIcon: 'assets/svg_icons/member_list_active.svg',
//       unselectedIcon: 'assets/svg_icons/member_list_inactive.svg',
//       label: 'Members',
//       onTap: () => Get.toNamed('/membersList'),
//     ),
//     NavigationItemCommon(
//       selectedIcon: 'assets/svg_icons/user_active.svg',
//       unselectedIcon: 'assets/svg_icons/user_inactive.svg',
//       label: 'Profile',
//       onTap: () => Get.toNamed('/profile'),
//     ),
//   ];

//   List<NavigationItemCommon> get bottomNavItems {
//     if (navigationItems.length <= 4) {
//       return navigationItems;
//     }
//     return [
//       ...navigationItems.take(3),
//       NavigationItemCommon(
//         selectedIcon: 'assets/svg_icons/more_active.svg',
//         unselectedIcon: 'assets/svg_icons/more_inactive.svg',
//         label: 'More',
//         onTap: () => Get.toNamed('/moreScreen'),
//       ),
//     ];
//   }

//   List<NavigationItemCommon> get moreScreenItems {
//     if (navigationItems.length <= 4) {
//       return [];
//     }
//     return navigationItems.skip(3).toList();
//   }
// }

// class DashboardView extends StatelessWidget {
//   DashboardView({Key? key}) : super(key: key);

//   final controller = Get.put(DashboardController());

//   @override
//   Widget build(BuildContext context) {
//     bool isLargeScreen = MediaQuery.of(context).size.width >= 700;
    
//     // For web view (in app bar)
//     if (isLargeScreen) {
//       return _buildWebNavigation(context);
//     }
    
//     // For mobile view (bottom navigation)
//     return _buildMobileNavigation(context);
//   }
  
//   Widget _buildWebNavigation(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: controller.navigationItems.map((item) {
//         int index = controller.navigationItems.indexOf(item);
//         return Obx(() {
//           bool isSelected = controller.selectedIndex.value == index;
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: InkWell(
//               onTap: () {
//                 controller.selectedIndex.value = index;
//                 item.onTap();
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 decoration: BoxDecoration(
//                   color: isSelected 
//                       ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3) 
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     SvgPicture.asset(
//                       isSelected ? item.selectedIcon : item.unselectedIcon,
//                       height: 20,
//                       color: isSelected 
//                           ? Theme.of(context).colorScheme.primary 
//                           : Colors.white,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       item.label,
//                       style: TextStyle(
//                         color: isSelected 
//                             ? Theme.of(context).colorScheme.primary 
//                             : Colors.white,
//                         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//       }).toList(),
//     );
//   }

//   Widget _buildMobileNavigation(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       height: Get.height * 0.1,
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.primaryContainer,
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromRGBO(0, 0, 0, 0.16),
//             spreadRadius: 5,
//             blurRadius: 19.6,
//             offset: Offset(0, 8),
//           ),
//         ],
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           _buildNavItem(
//             selectedIcon: controller.navigationItems[0].selectedIcon,
//             unselectedIcon: controller.navigationItems[0].unselectedIcon,
//             text: controller.navigationItems[0].label,
//             index: 0,
//             context: context,
//           ),
//           _buildNavItem(
//             selectedIcon: controller.navigationItems[1].selectedIcon,
//             unselectedIcon: controller.navigationItems[1].unselectedIcon,
//             text: controller.navigationItems[1].label,
//             index: 1,
//             context: context,
//           ),
//           _buildFAB(context),
//           _buildNavItem(
//             selectedIcon: controller.navigationItems[3].selectedIcon,
//             unselectedIcon: controller.navigationItems[3].unselectedIcon,
//             text: controller.navigationItems[3].label,
//             index: 3,
//             context: context,
//           ),
//           controller.navigationItems.length > 4
//               ? _buildNavItem(
//                   selectedIcon: 'assets/svg_icons/more_active.svg',
//                   unselectedIcon: 'assets/svg_icons/more_inactive.svg',
//                   text: 'More',
//                   index: 4,
//                   context: context,
//                   isMore: true,
//                 )
//               : _buildNavItem(
//                   selectedIcon: controller.navigationItems[4].selectedIcon,
//                   unselectedIcon: controller.navigationItems[4].unselectedIcon,
//                   text: controller.navigationItems[4].label,
//                   index: 4,
//                   context: context,
//                 ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFAB(BuildContext context) {
//     return Flexible(
//       child: Container(
//         padding: const EdgeInsets.only(bottom: 3),
//         height: Get.height * 52 / 896,
//         width: Get.width * 52 / 414,
//         child: FittedBox(
//           child: FloatingActionButton(
//             backgroundColor: Theme.of(context).colorScheme.secondary,
//             onPressed: () {
//               Get.toNamed(Routes.addMembers);
//             },
//             child: SvgPicture.asset('assets/svg_icons/add.svg'),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem({
//     required String selectedIcon,
//     required String unselectedIcon,
//     required String text,
//     required int index,
//     required BuildContext context,
//     bool isMore = false,
//   }) {
//     return Obx(() {
//       bool isSelected = controller.selectedIndex.value == index;
//       return Flexible(
//         child: GestureDetector(
//           onTap: () {
//             if (isMore) {
//               Get.toNamed('/moreScreen');
//             } else {
//               controller.selectedIndex.value = index;
//               controller.navigationItems[index].onTap();
//             }
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SvgPicture.asset(
//                 isSelected ? selectedIcon : unselectedIcon, 
//                 height: 24,
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 text,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
//                   color: Theme.of(context).colorScheme.surface,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }