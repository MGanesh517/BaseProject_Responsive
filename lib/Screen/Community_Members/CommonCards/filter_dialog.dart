import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Controller/community_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/models/mini_commonModel.dart';
import 'package:intl/intl.dart';

class FiltersAlertDialog extends StatefulWidget {
  const FiltersAlertDialog({
    super.key,
  });

  @override
  State<FiltersAlertDialog> createState() => _FiltersAlertDialogState();
}

class _FiltersAlertDialogState extends State<FiltersAlertDialog> {

  final List<MiniCommonModel> genderList = [
    MiniCommonModel(id: 1, name: "Male"),
    MiniCommonModel(id: 2, name: "Female"),
    MiniCommonModel(id: 3, name: "Others"),
  ];

  final List<MiniCommonModel> maritalChoices = [
    MiniCommonModel(id: 1, name: "Married"),
    MiniCommonModel(id: 2, name: "UnMarried"),
  ];

  final controller = Get.put(CommunityMembersController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actionsPadding: EdgeInsets.all(20),
        contentPadding: const EdgeInsets.all(20.0),
        title: Row(
          children: [
            ExpandTapWidget(
                tapPadding: EdgeInsets.all(10.0),
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close_sharp,
                  size: 18,
                )),
            Spacer(),
            Text(
              "Add Filters",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: Get.height * AppConstants.themeConstants.fontsize_15, fontWeight: FontWeight.w600),
            ),
            Spacer()
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(
              context,
              title: 'Gender',
              showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
              items: (filter, infiniteScrollProps) async {
                return controller.genderList;
              },
              itemBuilder: (context, MiniCommonModel? item, isSelected, isTrue) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: !isSelected
                      ? null
                      : BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                  child: ListTile(
                    selected: isSelected,
                    title: Text(item?.name! ?? ''),
                  ),
                );
              },
              compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
              itemAsString: (MiniCommonModel u) => u.name!,
              selectedItem: controller.gender != 0
                  ? controller.genderList.firstWhere(
                      (element) => element.id == controller.gender,
                    )
                  : null,
              onChanged: (MiniCommonModel? data) {
                controller.gender = data!.id!;
                // controller.communityMemberDetails.gender = data!.id;
                // controller.serviceRequestFilterData.status = data!.id;
              },
            ),
            Container(
              height: Get.height * 20 / 896,
            ),
            CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(
              context,
              title: 'Maritial Status',
              showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
              // items: statusList,
              items: (filter, infiniteScrollProps) async {
                return controller.maritalChoices;
              },
              itemBuilder: (context, MiniCommonModel? item, isSelected, isTrue) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: !isSelected
                      ? null
                      : BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                  child: ListTile(
                    selected: isSelected,
                    title: Text(item?.name! ?? ''),
                  ),
                );
              },
              compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
              itemAsString: (MiniCommonModel u) => u.name!,
              // selectedItem: controller.maritialStatus != ''
              //     ? controller.maritalChoices.firstWhere(
              //         (element) => element.id == controller.maritialStatus,
              //         orElse: () => MiniCommonModel(id: 0, name: ''),
              //       )
              //     : null,
              selectedItem: controller.maritialStatus != 0
                  ? controller.maritalChoices.firstWhere(
                      (element) => element.id == controller.maritialStatus,
                    )
                  : null,
              onChanged: (MiniCommonModel? data) {
                controller.maritialStatus =  data!.id;
              },
            ),
            Container(
              height: Get.height * 20 / 896,
            ),
            Row(
              children: [
                Flexible(
                  child: CommonComponents.defaultTextFormField(context, onTap: () async {
                    DateTime? selectedDate = await CommonService.instance.pickDate(context);
                    if (selectedDate != null) {
                      controller.fromDate.text = DateFormat('dd MMM, yyyy').format(selectedDate);
                    }
                  },
                      suffixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset('assets/svg_icons/Calendar.svg'),
                                ),
                      title: 'From Date',
                      hintText: 'Select Date',
                      controller: controller.fromDate,
                      readOnly: true),
                ),
                Container(
                  width: Get.width * 20 / 414,
                ),
                Flexible(
                  child: CommonComponents.defaultTextFormField(context, onTap: () async {
                    DateTime? selectedDate = await CommonService.instance.pickDate(context);
                    if (selectedDate != null) {
                      controller.toDate.text = DateFormat('dd MMM, yyyy').format(selectedDate);
                    }
                  },
                      suffixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset('assets/svg_icons/Calendar.svg'),
                                ),
                      title: 'To Date',
                      hintText: 'Select Date',
                      controller: controller.toDate,
                      readOnly: true),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Flexible(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width / 3, Get.height * 45 / 896),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    side: BorderSide(
                      width: 1.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                    controller.maritialStatus = 0;
                    controller.fromDate.clear();
                    controller.toDate.clear();
                    controller.gender = 0;
                    controller.communityMembersIsRefresh = true;
                    controller.getCommunityMembersList();
                  },
                  child: Center(
                    child: Text(
                      "Clear",
                      style: TextStyle(
                        fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: Get.width * 20 / 414,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(7),
                  ),
                  child: MaterialButton(
                    height: Get.height * 45 / 896,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    onPressed: () {
                      Get.back();
                      controller.communityMembersIsRefresh = true;
                      controller.getCommunityMembersList();
                    },
                    child: Center(
                        child: Text("Apply",
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
        ]);
  }
}
