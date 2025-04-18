import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_popup_menu.dart';

class NavigationItemCommon {
  final IconData icon;
  final String label;
  final Function() onTap;
  final MouseRegion? onHover;

  NavigationItemCommon({
    required this.icon,
    required this.label,
    required this.onTap,
    this.onHover,
  });
}

class NavigationItems {
  static final RxInt selectedIndex = 0.obs;
  // static final RxBool selectedValue = false.obs;
  // static final RxInt valueOFBottomIcon = 0.obs;

  static final List<NavigationItemCommon> items = [
    NavigationItemCommon(
      icon: Icons.dashboard,
      label: 'Members List',
      onTap: () => Get.toNamed('/membersListScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.apps,
      label: 'Add',
      onTap: () => Get.toNamed('/addMembers'),
    ),
    NavigationItemCommon(
      icon: Icons.data_usage,
      label: 'Profile',
      onTap: () => Get.toNamed('/profileScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.account_circle,
      label: 'Buttons',
      onTap: () => Get.toNamed('/buttonTypes'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'TextFields',
      onTap: () => Get.toNamed('/textFieldsCommonFields'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'Other Widgets',
      onTap: () => Get.toNamed('/otherDialogWidgets'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'profileScreenV2',
      onTap: () => Get.toNamed('/profileScreenV2'),
    ),
    NavigationItemCommon(
      icon: Icons.verified_user,
      label: 'ProfileScreen V3',
      onTap: () => Get.toNamed('/responsiveProfileScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'Date Picker Utils',
      onTap: () => Get.toNamed('/datePickerUtils'),
    ),
    NavigationItemCommon(
      icon: Icons.table_bar_outlined,
      label: 'Tabbar Screen',
      onTap: () => Get.toNamed('/tabBarScreen')
    ),
    NavigationItemCommon(
      icon: Icons.line_style_outlined,
      label: "Pagination Model Screen",
      onTap: () => Get.toNamed('/paginationExamples')
    ),

    NavigationItemCommon(
      icon: Icons.stream,
      label: 'Stepper Model Screen',
      onTap: () => Get.toNamed('/stepperWidgetExamples')
    ),
    NavigationItemCommon(
      icon: Icons.star_border_purple500_rounded,
      label: "Stepper 2 Screen",
      onTap: () => Get.toNamed('/antDesignStepperExampleScreen')
    ),NavigationItemCommon(
      icon: Icons.check_box,
      label: 'CheckBox && ColorPicker',
      onTap: () => Get.toNamed('/checkboxExamples')
    ),
    NavigationItemCommon(
      icon: Icons.data_exploration_rounded,
      label: "Different Type DatePickers",
      onTap: () => Get.toNamed('/antDatePickerDemoScreen')
    ),NavigationItemCommon(
      icon: Icons.grid_3x3,
      label: 'Grid Examples',
      onTap: () => Get.toNamed('/girdExamples')
    ),
    NavigationItemCommon(
      icon: Icons.grid_off_outlined,
      label: "Grid Examples 22",
      onTap: () => Get.toNamed('/responsiveGridExample')
    ),NavigationItemCommon(
      icon: Icons.arrow_drop_down_circle,
      label: 'Dropdown ModelScreen',
      onTap: () => Get.toNamed('/defaultDropdownStyles')
    ),
    NavigationItemCommon(
      icon: Icons.power_input,
      label: "Popup Multi Select",
      onTap: () => Get.toNamed('/popUpMultiSelect')
    ),
  ];

  static List<NavigationItemCommon> get bottomNavItems {
    if (items.length <= 4) {
      return items;
    }
    return [
      ...items.take(3),
      NavigationItemCommon(
        icon: Icons.more_vert_outlined,
        label: 'More',
        onTap: () => Get.toNamed('/moreScreen'),
      ),
    ];
  }

  static List<NavigationItemCommon> get moreScreenItems {
    if (items.length <= 4) {
      return [];
    }
    return items.skip(3).toList();
  }

  static List<NavigationItemCommon> get webNavItems {
    if (items.length <= 6) {
      return items;
    }
    return [
      ...items.take(5),
      NavigationItemCommon(
        icon: Icons.more_vert_outlined,
        label: 'More',
        onTap: () {},
      ),
    ];
  }
}

Widget buildWebNavigation() {
  final visibleItems = NavigationItems.items.take(4).toList();
  final moreItems = NavigationItems.items.skip(4).toList();
  final hasMoreItems = NavigationItems.items.length > 5;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ...visibleItems.map((item) {
        int index = NavigationItems.items.indexOf(item);
        return Obx(() => InkWell(
              onTap: () {
                NavigationItems.selectedIndex.value = index;
                item.onTap();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: NavigationItems.selectedIndex.value == index
                      ? Colors.transparent
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      item.label,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ));
      }).toList(),
      if (hasMoreItems)
        CommonPopupMenu<int>(
          tooltip: 'More Options',
          items: moreItems.asMap().entries.map((entry) {
            final actualIndex = entry.key + 4; // Replace maxVisibleItems with 4
            return CustomPopupMenuItem<int>(
              value: actualIndex,
              label: entry.value.label,
              icon: entry.value.icon,
              isSelected: NavigationItems.selectedIndex.value == actualIndex,
            );
          }).toList(),
          onSelected: (index) {
            NavigationItems.selectedIndex.value = index;
            moreItems[index - 4].onTap(); // Replace maxVisibleItems with 4
          },
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
    ],
  );
}

Widget buildMobileNavigation() {
  return Obx(() => BottomNavigationBar(
        currentIndex: NavigationItems.selectedIndex.value,
        onTap: (index) {
          NavigationItems.selectedIndex.value = index;
          NavigationItems.bottomNavItems[index].onTap();
        },
        type: BottomNavigationBarType.fixed,
        items: NavigationItems.bottomNavItems
            .map((item) => BottomNavigationBarItem(
                  tooltip: item.label,
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
      ));
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('More Options'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: NavigationItems.items.length,
          itemBuilder: (context, index) {
            final item = NavigationItems.items[index];
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.label),
              onTap: () {
                NavigationItems.items[index].onTap();
                // Get.back();
              },
            );
          },
        ),
      ),
    );
  }
}