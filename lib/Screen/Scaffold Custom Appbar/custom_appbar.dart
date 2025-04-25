
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/logout_dialog.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/notification_widget.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/bottomNavigation_and_appbar_for_web.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/drawer_code.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/drawer_controller.dart';
import 'package:gowri_seva_sangam/Screen/login/Controller/controller.dart';


//////************************************** CommonComponent for the EveryPage **************************************//////
enum Menu { preview, share, getLink, remove, download }

class CommonScaffoldWithAppBar extends StatelessWidget {
  final Widget body;
  final Color? appBarBGColor, iconColor;
  final VoidCallback? leadingLink;
  final Widget? leadingChild;
  final String? titleChild;
  final List<Widget>? actionsWidget;
  final bool? centerTitle;
  final Widget? floatingActionButtonWidget;
  final bool showLeadingDrawer;
  final bool showEndDrawer;


CommonScaffoldWithAppBar({
  super.key,
  required this.body,
  this.appBarBGColor,
  this.leadingLink,
  this.iconColor,
  this.leadingChild,
  this.titleChild,
  this.actionsWidget,
  this.centerTitle,
  this.floatingActionButtonWidget,
  this.showLeadingDrawer = true,
  this.showEndDrawer = false
});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final loginController = Get.put(LoginController());
  final controller = Get.put(DrawerControllerX());
  
  void showTopDialog(BuildContext context) {
    Get.dialog(
      LogoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth >= 700;

        if (MediaQuery.of(context).size.width < 700 &&
            !Get.find<DrawerControllerX>().isTextNotVisible) {
          Get.find<DrawerControllerX>().toggleShowText();
        }

        Widget drawer = AdaptiveDrawer(
          title: '',
          currentScreen: body,
          onScreenSelected: (screen) {
            if (!isLargeScreen) {
              Navigator.of(context).pop();
            }
          },
        );
        return Scaffold(
          backgroundColor: Colors.grey[50],
          key: scaffoldKey,
          appBar: CustomAppBar(
            // toolbarHeight: 64,
            // automaticallyImplyLeading: false,
            // elevation: 0.0,
            // backgroundColor: appBarBGColor ?? Colors.transparent,
            // flexibleSpace: Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
            //       colors: [Theme.of(context).colorScheme.secondaryContainer, Theme.of(context).colorScheme.secondary]),
            //   ),
            // ),
            // leadingChild: isLargeScreen ? leadingChild != null
            //     ? Align(
            //         alignment: Alignment.center,
            //         child: InkWell(
            //           highlightColor: Colors.transparent,
            //           onTap: leadingLink,
            //           child: leadingChild,
            //         ),
            //       )
            //     : IconButton(
            //         icon: Icon(Icons.menu, color: iconColor ?? Colors.white),
            //         onPressed: () {
            //           if (!isLargeScreen) {
            //             scaffoldKey.currentState?.openDrawer();
            //           } else {
            //             Get.find<DrawerControllerX>().toggleShowText();
            //           }
            //         },
            //       ) : null,

            leadingChild: isLargeScreen ? IconButton(
                    icon: Icon(Icons.menu, color: iconColor ?? Colors.white),
                    onPressed: () {
                      if (!isLargeScreen) {
                        scaffoldKey.currentState?.openDrawer();
                      } else {
                        Get.find<DrawerControllerX>().toggleShowText();
                      }
                    },
                  ) : Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: leadingLink,
                      child: leadingChild,
                    ),
                  ),

            titleChild: isLargeScreen ? buildWebNavigation() : null,
            actionsWidget: [
              NotificationPopup(),
              SizedBox(width: 10.0),
              IconButton(onPressed: () => showTopDialog(context), icon: Icon(Icons.logout)),
              // PopupMenuButton(
              //   icon: Icon(Icons.account_circle_sharp),
              //   color: Colors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   elevation: 2,
              //   offset: Offset(0, 60),
              //   itemBuilder: (context) {
              //   return [
              //     PopupMenuItem(
              //       value: 1,
              //       child: Text('Profile'),
              //       onTap: () {
              //         Get.toNamed('/responsiveProfileScreen');
              //       },
              //     ),
              //     PopupMenuItem(
              //       value: 2,
              //       child: Text('Settings'),
              //     ),
              //     PopupMenuItem(
              //       value: 3,
              //       child: Text('Logout'),
              //       onTap: () {
              //         showTopDialog(context);
              //       },
              //     ),
              //   ];
              // }),
              PopupMenuButton<Menu>(
                // offset: Offset(30, 40),
                      // popUpAnimationStyle: _animationStyle,
                      icon: const Icon(Icons.more_rounded),
                      onSelected: (Menu item) {},
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                        PopupMenuItem<Menu>(
                          value: Menu.preview,
                          child: ListTile(
                            leading: Icon(Icons.visibility_outlined),
                            title: Text('Profile'),
                            onTap: () {
                              Get.toNamed('/responsiveProfileScreen');
                            },
                          ),
                        ),
                        const PopupMenuItem<Menu>(
                          value: Menu.share,
                          child: ListTile(
                            leading: Icon(Icons.share_outlined),
                            title: Text('Settings'),
                          ),
                        ),
                        PopupMenuItem<Menu>(
                          value: Menu.getLink,
                          child: ListTile(
                            leading: Icon(Icons.link_outlined),
                            title: Text('Logout'),
                            onTap: () {
                              showTopDialog(context);
                            },
                          ),
                        ),
                        // const PopupMenuDivider(),
                        // const PopupMenuItem<Menu>(
                        //   value: Menu.remove,
                        //   child: ListTile(
                        //     leading: Icon(Icons.delete_outline),
                        //     title: Text('Remove'),
                        //   ),
                        // ),
                        // const PopupMenuItem<Menu>(
                        //   value: Menu.download,
                        //   child: ListTile(
                        //     leading: Icon(Icons.download_outlined),
                        //     title: Text('Download'),
                        //   ),
                        // ),
                      ],
                    ),
              SizedBox(width: isLargeScreen ? 30 : 10),

              /////   Code for the Right side drawer Already given the bool value if we giv ethe bool value is enough

              // isLargeScreen ? IconButton(
              //       icon: Icon(Icons.menu, color: iconColor ?? Colors.white),
              //       onPressed: () {
              //         if (!isLargeScreen) {
              //           scaffoldKey.currentState?.openDrawer();
              //         } else {
              //           Get.find<DrawerControllerX>().toggleShowText();
              //         }
              //       },
              //     ) : Align(
              //       alignment: Alignment.center,
              //       child: InkWell(
              //         highlightColor: Colors.transparent,
              //         onTap: leadingLink,
              //         child: leadingChild,
              //       ),
              //     ),

              SizedBox(width: isLargeScreen ? 30 : 10),
            ],
            centerTitle: centerTitle,
          ),
          drawer: !isLargeScreen && showLeadingDrawer ? drawer : null,
          endDrawer: !isLargeScreen && showEndDrawer ? drawer : null,
          body: SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                if (isLargeScreen && showLeadingDrawer)
                  Obx(() => SizedBox(
                    width: Get.find<DrawerControllerX>().isTextNotVisible ? 250 : 70,
                    child: drawer,
                  )),
                VerticalDivider(thickness: 0.5, width: 0.5,),

                Expanded(child: body),

                if (isLargeScreen && showEndDrawer)
                  VerticalDivider(thickness: 0.5, width: 0.5,),
                if (isLargeScreen && showEndDrawer)
                  Obx(() => SizedBox(
                    width: Get.find<DrawerControllerX>().isTextNotVisible ? 250 : 70,
                    child: drawer,
                  )),
              ],
            ),
          ),
          bottomNavigationBar: !isLargeScreen ? buildMobileNavigation() : null,
          floatingActionButton: floatingActionButtonWidget,
        );
      },
    );
  }
}

/////////////////////         Main        //////////////////////

// class AdaptiveDrawer extends StatefulWidget {
//   final String title;
//   final Widget currentScreen;
//   final Function(Widget) onScreenSelected;

//   const AdaptiveDrawer({
//     super.key,
//     required this.title,
//     required this.currentScreen,
//     required this.onScreenSelected,
//   });

//   @override
//   _AdaptiveDrawerState createState() => _AdaptiveDrawerState();
// }

// class _AdaptiveDrawerState extends State<AdaptiveDrawer> {
//   final drawerController = Get.find<DrawerControllerX>();

//   void onItemTapped(int index, String route) {
//     drawerController.selectedIndex = index;
//     Get.toNamed(route);
//   }

// //////************************************** Drawer & it's SubItems **************************************//////


//   @override
//   Widget build(BuildContext context) {
//     final drawerController = Get.find<DrawerControllerX>();
//     return Drawer(
//       elevation: 0,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           MediaQuery.of(context).size.width <= 700
//               ? Container(height: 70)
//               : Container(height: 0),
//            Obx(() => CommonCardForDrawer(
//                 title: drawerController.isTextNotVisible
//                     ? const Text('Members')
//                     : const SizedBox.shrink(),
//                 icon: const Icon(Icons.list_alt_outlined),
//                 isSelected: drawerController.selectedIndex == 0,
//                 onTapNavigation: () => onItemTapped(0, '/membersListScreen'),
//               )),
//            Obx(() => CommonCardForDrawer(
//                 title: drawerController.isTextNotVisible
//                     ? const Text('Add Members')
//                     : const SizedBox.shrink(),
//                 icon: const Icon(Icons.list_alt_outlined),
//                 isSelected: drawerController.selectedIndex == 1,
//                 onTapNavigation: () => onItemTapped(1, '/addMembers'),
//               )),
//           Obx(() => CommonCardForDrawer(
//                 title: drawerController.isTextNotVisible
//                     ? const Text('Profile')
//                     : const SizedBox.shrink(),
//                 icon: const Icon(Icons.list_alt_outlined),
//                 isSelected: drawerController.selectedIndex == 2,
//                 onTapNavigation: () => onItemTapped(2, '/profileScreen'),
//               )),
//         ],
//       ),
//     );
//   }
// }

////////////////////       Secondary List Dynamically Created       //////////////////////

class AdaptiveDrawer extends StatefulWidget {
  final String title;
  final Widget currentScreen;
  final Function(Widget) onScreenSelected;

  const AdaptiveDrawer({
    super.key,
    required this.title,
    required this.currentScreen,
    required this.onScreenSelected,
  });

  @override
  _AdaptiveDrawerState createState() => _AdaptiveDrawerState();
}

class _AdaptiveDrawerState extends State<AdaptiveDrawer> {
  final drawerController = Get.find<DrawerControllerX>();

  void onItemTapped(int index, String route) {
    drawerController.selectedIndex = index;
    Get.toNamed(route);
  }

  final List<Map<String, dynamic>> drawerItems = [
    {
      'title': 'Members',
      'icon': Icons.list_alt_outlined,
      'route': '/membersListScreen',
    },
    {
      'title': 'Add Members',
      'icon': Icons.person_add_alt_1,
      'route': '/addMembers',
    },
    {
      'title': 'Profile',
      'icon': Icons.person_outline,
      'route': '/profileScreen',
    },
    {
      'title': 'Buttons',
      'icon': Icons.account_circle,
      'route': '/buttonTypes',
    },
    {
      'title': 'TextFields',
      'icon': Icons.settings,
      'route': '/textFieldsCommonFields',
    },
    {
      'title': 'Other Widgets',
      'icon': Icons.person_outline,
      'route': '/otherDialogWidgets',
    },
    {
      'title': 'Profile Screen V2',
      'icon': Icons.propane_sharp,
      'route': '/profileScreenV2',
    },
    {
      'title': 'Profile Screen V3',
      'icon': Icons.propane_sharp,
      'route': '/responsiveProfileScreen',
    },
    {
      'title': 'Date Picker Utils',
      'icon': Icons.date_range,
      'route': '/datePickerUtils',
    },
    {
      'title': 'TabBar Screen',
      'icon': Icons.table_bar_rounded,
      'route': '/tabBarScreen',
    },
    {
      'title': 'Pagination Models Screen',
      'icon': Icons.line_style_rounded,
      'route': '/paginationExamples',
    },
    {
      'title': 'Stepper Models Screen',
      'icon': Icons.scatter_plot_sharp,
      'route': '/stepperWidgetExamples',
    },
    {
      'title': 'Stepper 2 Screen',
      'icon': Icons.stream,
      'route': '/antDesignStepperExampleScreen',
    },
    {
      'title': 'CheckBox && ColorPicker',
      'icon': Icons.check_box,
      'route': '/checkboxExamples',
    },
    {
      'title': 'Different Type Date Pickers',
      'icon': Icons.date_range_outlined,
      'route': '/antDatePickerDemoScreen',
    },
    {
      'title': 'Grid Examples',
      'icon': Icons.grid_off_outlined,
      'route': '/girdExamples',
    },
    {
      'title': 'Grid Examples 222',
      'icon': Icons.grid_off_outlined,
      'route': '/responsiveGridExample',
    },
    {
      'title': 'Dropdown Model Styles',
      'icon': Icons.arrow_drop_down_circle,
      'route': '/defaultDropdownStyles',
    },
    {
      'title': 'Popup Multi Select',
      'icon': Icons.phone_paused_sharp,
      'route': '/popUpMultiSelect',
    },
    {
      'title': 'BreadCrumb Example',
      'icon': Icons.breakfast_dining,
      'route': '/breadcrumbFucntion',
    },
    {
      'title': 'Upload UI Document',
      'icon': Icons.upload,
      'route': '/uploadDocumentUiExamples',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          MediaQuery.of(context).size.width <= 700
              ? const SizedBox(height: 70)
              : const SizedBox.shrink(),

          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: drawerItems.length,
                itemBuilder: (context, index) {
                  final item = drawerItems[index];
                  return Obx(() => CommonCardForDrawer(
                                      // title: drawerController.isTextNotVisible
                                      //     ? Text(item['title'])
                                      //     : const SizedBox.shrink(),
                                      title : drawerController.isTextNotVisible
                                      ? Text(item['title'])
                                      : const SizedBox.shrink(),
                                      icon: Icon(item['icon']),
                                      isSelected: drawerController.selectedIndex == index,
                                      onTapNavigation: () => onItemTapped(index, item['route']),
                                    ));
                },
              ),
          ),
        ],
      ),
    );
  }
}
