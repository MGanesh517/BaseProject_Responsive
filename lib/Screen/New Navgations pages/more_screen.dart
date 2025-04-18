import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/bottomNavigation_and_appbar_for_web.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleChild: Text('More Options'),
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
