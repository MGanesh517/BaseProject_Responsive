import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Routes/app_pages.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/CommonCards/relation_card_view_by_id.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Controller/community_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/add_bottomsheet.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:gowri_seva_sangam/Utils/photo_view_page.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final commonStyle =
      const TextStyle(fontWeight: FontWeight.w600, color: Colors.black);
  final controller = Get.put(CommunityMembersController());

  Widget _fallbackProfileIcon(String? fullname) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _generateLightColor(),
      ),
      child: Center(
        child: Text(
          (fullname != null && fullname.isNotEmpty) ? fullname[0].toUpperCase() : '?',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  /// Generates a random **light color** for background
  Color _generateLightColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      200 + random.nextInt(56), // Ensures light shades for Red
      200 + random.nextInt(56), // Ensures light shades for Green
      200 + random.nextInt(56), // Ensures light shades for Blue
    );
  }


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLargeScreen = constraints.maxWidth > 500;

        return CommonScaffoldWithAppBar(
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: isLargeScreen
                  ? const EdgeInsets.symmetric(vertical: 30, horizontal: 50)
                  : const EdgeInsets.all(16.0),
              child: Container(
                // height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: isLargeScreen
                      ? BorderRadius.circular(10)
                      : const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    Get.back();
                  }, icon: Icon(Icons.chevron_left)),
                  Text(
                    "Detail Screen",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      // color: Theme.of(context).colorScheme.primary,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
                          Card(
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (controller.communityMemberDetails.profilePicture != null &&
                                          controller.communityMemberDetails.profilePicture!.isNotEmpty) {
                                        Get.to(
                                          PhotoViewPage(
                                            type: 'network',
                                            photo: controller.communityMemberDetails.profilePicture!,
                                          ),
                                          transition: Transition.downToUp,
                                          duration: const Duration(milliseconds: 300),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // border: Border.all(color: Colors.grey),
                                      ),
                                      child: controller.communityMemberDetails.profilePicture != null &&
                                              controller.communityMemberDetails.profilePicture!.isNotEmpty
                                          ? ClipOval(
                                              child: Image.network(
                                                controller.communityMemberDetails.profilePicture!,
                                                height: double.infinity,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (context, child, loadingProgress) {
                                                  if (loadingProgress == null) return child;
                                                  return Center(
                                                    child: CircularProgressIndicator(
                                                      value: loadingProgress.expectedTotalBytes != null
                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                              (loadingProgress.expectedTotalBytes ?? 1)
                                                          : null,
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (context, error, stackTrace) {
                                                  return _fallbackProfileIcon(controller.communityMemberDetails.fullname);
                                                },
                                              ),
                                            )
                                          : _fallbackProfileIcon(controller.communityMemberDetails.fullname),
                                    ),
                                  ),
                                  SizedBox(width: Get.width * 20 / 896),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.communityMemberDetails.fullname ?? "N/A",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
                                          color: Theme.of(context).colorScheme.surface,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Mobile Number : ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                                              color: Theme.of(context).colorScheme.onSurface,
                                            ),
                                          ),
                                          Text(
                                            controller.communityMemberDetails.phone ?? '-',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
                                              color: Theme.of(context).colorScheme.surface,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      print("print the id in viewby id ::: ${controller.communityMemberDetails.id}");
                                      Get.toNamed(
                                        Routes.addMembers,
                                        arguments: {'id': controller.communityMemberDetails.id, 'isEdit': true}
                                      );
                                    },
                                    child: SvgPicture.asset('assets/svg_icons/Edit.svg')),
                                ],
                              ),
                            ),
                          ),
                    TabBar(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: isLargeScreen,
                      tabAlignment: isLargeScreen ? TabAlignment.start : null,
                      controller: _tabController,
                      tabs: const [
                        Tab(text: "Member Details"),
                        Tab(text: "Family Members"),
                      ],
                      indicatorColor: Colors.blue,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                    ),
                    SizedBox(height: isLargeScreen ? 25 : 12),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                                          child: Container(
                                            padding: const EdgeInsets.all(14.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Theme.of(context).colorScheme.primaryContainer,
                                              // border: Border.all(color: Theme.of(context).colorScheme.onSurface),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                buildDetailRow(context, 'Email Id',
                                                  controller.communityMemberDetails.email ?? "N/A"),
                                                buildDetailRow(context, 'Community',
                                                  controller.communityMemberDetails.community?.name ?? "N/A"),
                                                buildDetailRow(context, 'Marital Status',
                                                  controller.communityMemberDetails.maritalName ?? 'N/A'),
                                                buildDetailRow(context, 'Phone Number',
                                                  controller.communityMemberDetails.phone ?? 'N/A'),
                                                buildDetailRow(context, 'Address',
                                                  controller.communityMemberDetails.address ?? "N/A"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        
                                        Column(
                                          children: [
                                            Expanded(
                                            child: Obx(() =>
                                            GridView.builder(
                                              itemCount: controller.communityMemberDetails.relations?.length ?? 0,
                                              shrinkWrap: true,
                                              physics: const ClampingScrollPhysics(),
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: MediaQuery.of(context).size.width <= 800
                                                    ? 1
                                                    : MediaQuery.of(context).size.width <= 1300
                                                        ? 2
                                                        : MediaQuery.of(context).size.width <= 1700
                                                            ? 3
                                                            : 4,
                                                childAspectRatio: 1,
                                                crossAxisSpacing: MediaQuery.of(context).size.width <= 400 ? 10 : 30,
                                                mainAxisExtent: MediaQuery.of(context).size.width <= 1300? 125 : 0,
                                              ),
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(1.0),
                                                  child: RelationListCard(
                                                    userId: controller.communityMemberDetails.relations?[index].relationTo?.id ?? '',
                                                    image: controller.communityMemberDetails.relations?[index].relationTo?.profilePicture ?? '',
                                                    name: controller.communityMemberDetails.relations?[index].relationTo?.fullname ?? 'N/A',
                                                    relationship: controller.communityMemberDetails.relations?[index].relationtypeName ?? '',
                                                    mobileNumber: controller.communityMemberDetails.relations?[index].relationTo?.phone ?? 'N/A',
                                                    onTap: () {
                                                      controller.getCommunityMemberDetailView(
                                                        controller.communityMemberDetails.relations?[index].relationTo?.id
                                                      );
                                                    },
                                                    onDelete: () {
                                                      controller.communityMembersIsRefresh = true;
                                                      controller.getCommunityMembersList();
                                                      controller.update();
                                                    },
                                                  ),
                                                );
                                              },
                                            )
                                            )),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (controller.communityMemberDetails.gender == 1 &&
                                                      controller.communityMemberDetails.maritalStatus == 1) {
                                                    Get.bottomSheet(
                                                      Container(
                                                        height: Get.height * 0.75,
                                                        decoration: BoxDecoration(
                                                          color: Theme.of(context).colorScheme.primaryContainer,
                                                          borderRadius: const BorderRadius.only(
                                                            topLeft: Radius.circular(22),
                                                            topRight: Radius.circular(22),
                                                          ),
                                                        ),
                                                        child: AddChildMembersBottomSheet(
                                                          presetFatherId: controller.communityMemberDetails.id,
                                                        ),
                                                      ),
                                                      isScrollControlled: true,
                                                    ).whenComplete(() {
                                                      controller.disposeController();
                                                    });
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(double.infinity, 45),
                                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Add Family Member',
                                                  style: TextStyle(
                                                    color: Theme.of(context).colorScheme.primaryContainer,
                                                    fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: Get.height * AppConstants.themeConstants.fontsize_12,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            value,
            style: TextStyle(
              fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
