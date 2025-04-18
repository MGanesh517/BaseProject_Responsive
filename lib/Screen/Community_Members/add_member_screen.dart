import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Controller/community_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/mini_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/models/mini_commonModel.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Models/get_community_members_list.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Controller/profile_controller.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class AddCommunityMembers extends StatefulWidget {
  const AddCommunityMembers({super.key});

  @override
  State<AddCommunityMembers> createState() => _AddCommunityMembersState();
}

class _AddCommunityMembersState extends State<AddCommunityMembers> {
  final controller = Get.put(CommunityMembersController());
  final profileController = Get.put(ProfileController());
  final miniController = Get.put(MiniController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final focusNodes = Iterable<int>.generate(6).map((_) => FocusNode()).toList();

  @override
  Widget build(BuildContext context) {
    print('print the community name :::: ${controller.postMembersData.fatherId}');
    return CommonScaffoldWithAppBar(
      body: GetBuilder<CommunityMembersController>(
        initState: (_) => CommunityMembersController.to.inItDetailState(),
        builder: (va) => SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(height: Get.height * 18 / 896),
                              ResponsiveRow(
                                spacing: Get.height * 10 / 896,
                                runSpacing: Get.height * 10 / 896,
                                columns: [
                                ResponsiveColumn(ResponsiveConstants().textFormField, child: Row(
                                children: [
                                  Expanded(
                                    child: CommonComponents.defaultTextFormField(
                                      context,
                                      controller: controller.firstNameController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      title: 'First Name',
                                      hintText: 'Enter First Name',
                                      // focusNode: Platform.isIOS ? focusNodes[0] : null,
                                      validator: (value) => value!.isEmpty ? 'Name is required' : null,
                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9A-Za-z ,./?@&()!%*]'))],
                                    ),
                                  ),
                                  SizedBox(width: Get.width * 5 / 896),
                                  Expanded(
                                    child: CommonComponents.defaultTextFormField(
                                      context,
                                      controller: controller.lastNameController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      hintText: 'Enter Surname',
                                      // focusNode: Platform.isIOS ? focusNodes[1] : null,
                                      title: 'Surname',
                                      validator: (value) => value!.isEmpty ? 'Surname is required' : null,
                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9A-Za-z ,./?@&()!%*]'))],
                                    ),
                                  ),
                                ],
                              )),
                              ResponsiveColumn(ResponsiveConstants().textFormField, child:  CommonComponents.defaultTextFormField(
                                context,
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                title: 'Community Name',
                                controller: TextEditingController(text: "${profileController.userDetails.community?.name}"),
                              )),
                              ResponsiveColumn(ResponsiveConstants().textFormField, child: Row(
                              children: [
                                Expanded(child: Obx(() => CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(
                                context,
                                title: "Gender",
                                hintText: 'Select Gender',
                                showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
                                items: (filter, infiniteScrollProps) async {
                                  miniController.getCommunityIsRefresh = true;
                          
                                  return controller.genderList;
                                },
                                itemBuilder: (context, MiniCommonModel? item, isSelected, isTrue) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    decoration: !isSelected
                                        ? null
                                        : BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Theme.of(context).colorScheme.secondaryContainer,
                                          ),
                                    child: ListTile(
                                      selected: isSelected,
                                      title: Text(
                                        item?.name ?? '',
                                        style: TextStyle(color: Theme.of(context).colorScheme.surface),
                                      ),
                                    ),
                                  );
                                },
                                selectedItem: controller.genderList.firstWhereOrNull(
                                  (item) => item.id == controller.postMembersData.gender,
                                ),
                                validator: (MiniCommonModel? value) {
                                  if (value == null || value.name == null || value.name!.isEmpty) {
                                    return 'Gender is required';
                                  }
                                  return null;
                                },
                                compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                itemAsString: (MiniCommonModel u) => u.name ?? '',
                                onChanged: (MiniCommonModel? data) {
                                  if (data != null) {
                                  print("Print the gender :::: ===>>> ${data.id}");
                                  controller.postMembersData.gender = data.id;
                                  controller.update();
                                  }
                                },
                              ))),
                              SizedBox(width: Get.width * 18 / 896),
                              Expanded(child: Obx(() =>  CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(
                                context,
                                title: 'Marital Status',
                                hintText: "Select Marital Status",
                                showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
                                items: (filter, infiniteScrollProps) async {
                                  miniController.getCommunityIsRefresh = true;
                                  return controller.maritalChoices;
                                },
                                itemBuilder: (context, MiniCommonModel? item, isSelected, isTrue) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    decoration: isSelected
                                        ? BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Theme.of(context).colorScheme.secondaryContainer,
                                          )
                                        : null,
                                    child: ListTile(
                                      selected: isSelected,
                                      title: Text(
                                        item?.name ?? '',
                                        style: TextStyle(color: Theme.of(context).colorScheme.surface),
                                      ),
                                    ),
                                  );
                                },
                                selectedItem: controller.maritalChoices.firstWhereOrNull(
                                  (item) => item.id == controller.postMembersData.maritalStatus,
                                ),
                                compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                itemAsString: (MiniCommonModel u) => u.name ?? '',
                                onChanged: (MiniCommonModel? data) {
                              
                                  if (data != null) {
                                    print("Selected Marital Status: ${data.id}");
                                      controller.postMembersData.maritalStatus = data.id;
                                        if (data.id != null) {
                                          controller.updateMaritalStatus(data.id!);
                                          controller.update();
                                        }
                                        controller.update();
                                  }
                                },
                              )))
                              ],
                            )),

                            ResponsiveColumn(ResponsiveConstants().textFormField, child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Expired :",
                                          style: TextStyle(
                                            fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context).colorScheme.surface,
                                          ),
                                        ),
                                        Obx(() => Switch(
                                              value: controller.isLate.value,
                                              onChanged: (bool newValue) {
                                                print("Switch toggled: ${controller.isLate.value} → $newValue");
                                                controller.isLate.value = newValue;
                                                controller.update();
                                              },
                                            )),
                                      ],
                                    ),
                                  ),
                                        Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                "In Law's :",
                                                style: TextStyle(
                                                fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context).colorScheme.surface,
                                                )),
                                            Obx(() => Switch(
                                              value: controller.isLate.value,
                                              onChanged: (bool newValue) {
                                                print("Switch toggled: ${controller.isLate.value} → $newValue");
                                                controller.isLate.value = newValue;
                                                controller.update();
                                              },
                                            )),
                                            ],
                                          ),
                                        ),
                                ],
                              )),

                              ResponsiveColumn(ResponsiveConstants().textFormField, child: Obx(() => CommonComponents.defaultNewDropdownSearch<GetCommunityMembersData>(
                                                              context,
                                                              title: "Father",
                                                              hintText: "Select Father",
                                                              showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
                                                              items: (filter, infiniteScrollProps) async {
                                                                // Only refresh if needed
                                                                if (controller.communityMembersList.isEmpty) {
                                                                  miniController.getCommunityIsRefresh = true;
                                                                  await controller.getCommunityMembersList();
                                                                }
                                                                return controller.communityMembersList;
                                                              },
                                                              itemBuilder: (context, GetCommunityMembersData? item, isSelected, isTrue) {
                                                                if (item == null) return const SizedBox();
                                                                return Container(
                                                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                                                  decoration: isSelected
                                                                      ? BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          color: Theme.of(context).colorScheme.secondaryContainer,
                                                                        )
                                                                      : null,
                                                                  child: ListTile(
                                                                    selected: isSelected,
                                                                    leading: Container(
                                                                      width: 50,
                                                                      height: 50,
                                                                      decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        border: Border.all(color: Colors.grey),
                                                                      ),
                                                                      child: ClipOval(
                                                                        child: item.profilePicture != null && item.profilePicture!.isNotEmpty
                                                                            ? Image.network(
                                                                                item.profilePicture!,
                                                                                fit: BoxFit.cover,
                                                                                errorBuilder: (context, error, stackTrace) => SvgPicture.asset('assets/svg_icons/Broken.svg'),
                                                                              )
                                                                            : SvgPicture.asset('assets/svg_icons/user_2.svg', fit: BoxFit.contain),
                                                                      ),
                                                                    ),
                                                                    title: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          item.fullname ?? 'Unknown',
                                                                        ),
                                                                        Text(
                                                                          item.phone ?? '-', style: TextStyle(fontSize: 12.0),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              selectedItem: controller.postMembersData.fatherId != null
                                                                ? controller.communityMembersList.firstWhereOrNull(
                                                                    (item) => item.id == controller.postMembersData.fatherId)
                                                                : null,
                                                                
                                                              validator: (GetCommunityMembersData? value) {
                                                                // if (controller.postMembersData.gender == 1 && controller.postMembersData.isLate == true) {
                                                                //   return null;
                                                                // }
                                                                if ((controller.postMembersData.gender == 1 && controller.isLate.value == false) ||
                                                                    (controller.postMembersData.gender == 2 && controller.postMembersData.maritalStatus == 2)) {
                                                                  if (value == null) {
                                                                    return 'Father is required';
                                                                  }
                                                                }
                                                                return null;
                                                              },
                                                              compareFn: (i, GetCommunityMembersData? s) => i.id == s?.id,
                                                              itemAsString: (GetCommunityMembersData u) => u.fullname ?? '',
                                                              onChanged: (GetCommunityMembersData? data) {
                                                                if (data != null) {
                                                                  controller.postMembersData.fatherId = data.id;
                                                                  controller.update();
                                                                }
                                                              },
                                                            ))),

                                                            ResponsiveColumn(ResponsiveConstants().textFormField,
                                                            child:  Obx(() => 
                                                            CommonComponents.defaultDropdownSearchMultipleSelection<MiniCommonModel>(
                                context,
                                title: "Gender",
                                hintText: 'Select Gender',
                                showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
                                items: (filter, infiniteScrollProps) async {
                                  miniController.getCommunityIsRefresh = true;
                          
                                  return controller.genderList;
                                },
                                itemBuilder: (context, MiniCommonModel? item, isSelected, isTrue) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    decoration: !isSelected
                                        ? null
                                        : BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Theme.of(context).colorScheme.secondaryContainer,
                                          ),
                                    child: ListTile(
                                      selected: isSelected,
                                      title: Text(
                                        item?.name ?? '',
                                        style: TextStyle(color: Theme.of(context).colorScheme.surface),
                                      ),
                                    ),
                                  );
                                },
                                selectedItem: controller.genderList.firstWhereOrNull(
                                  (item) => item.id == controller.postMembersData.gender,
                                ),
                                // validator: (MiniCommonModel? value) {
                                //   if (value == null || value.name == null || value.name!.isEmpty) {
                                //     return 'Gender is required';
                                //   }
                                //   return null;
                                // },
                                compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                // itemAsString: (MiniCommonModel u) => u.name ?? '',
                                // onChanged: (MiniCommonModel? data) {
                                //   if (data != null) {
                                //   print("Print the gender :::: ===>>> ${data.id}");
                                //   controller.postMembersData.gender = data.id;
                                //   controller.update();
                                //   }
                                // },
                              ))),


                              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponents.defaultTextFormField(
                                context,
                                controller: controller.emailController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                // focusNode: Platform.isIOS ? focusNodes[2] : null,
                                hintText: 'Enter Email Id',
                                title: 'Email',
                              )),

                              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponents.defaultTextFormField(
                                context,
                                controller: controller.phoneNumberController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                hintText: 'Enter Mobile Number',
                                // focusNode: Platform.isIOS ? focusNodes[3] : null,
                                title: 'Mobile Number',
                                maxLength: 10,
                                validator: (value) {
                                  if (controller.isLate.value == true) {
                                    return null;
                                  }
                                  return value!.isEmpty ? 'Mobile Number is required' : null;
                                },
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                              )),

                              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponents.defaultTextFormField(
                                context,
                                controller: controller.aadharNumber,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                // focusNode: Platform.isIOS ? focusNodes[4] : null,
                                maxLength: 12,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                                hintText: 'Enter Aadhar Number',
                                title: 'Aadhar Number',
                              ),),

                              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponents.defaultTextFormField(
                                      context,
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: SvgPicture.asset('assets/svg_icons/Calendar.svg'),
                                        ),                                      onTap: () async {
                                        final DateTime? picked = await showDatePicker(
                                          context: context,
                                          lastDate: DateTime(2200),
                                          firstDate: DateTime(1900),
                                        );
                                        if (picked != null) {
                                          controller.selectedDate = picked;
                                          controller.date.text = DateFormat('dd MMM, yyyy').format(picked);
                                        } else {
                                          controller.date.clear();
                                        }
                                        controller.update();
                                      },
                                      hintText: 'Select Date of Birth',
                                      title: 'Date of Birth',
                                      controller: controller.date,
                                      readOnly: true,
                                    )),

                                    ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponents.defaultTextFormField(
                                              context,
                                              hintText: 'Enter Address',
                                              title: 'Address',
                                          // focusNode: Platform.isIOS ? focusNodes[5] : null,
                                              textInputAction: TextInputAction.done,
                                              controller: controller.addressController,
                                              keyboardType: TextInputType.multiline,
                                            )),

                                            ResponsiveColumn(ResponsiveConstants().textFormField, child: Obx(() => Visibility(
                                                      visible: controller.isSpouseDropdownEnabled.value || controller.postMembersData.maritalStatus == 1 || controller.postMembersData.spouseId != null,
                                                      child: CommonComponents.defaultNewDropdownSearch<GetCommunityMembersData>(
                                                        context,
                                                        title: "Select Spouse",
                                                        showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
                                                        items: (filter, infiniteScrollProps) async {
                                                          miniController.getCommunityIsRefresh = true;
                                                          await controller.getCommunityMembersList();
                                                          return controller.communityMembersList;
                                                        },
                                                        itemBuilder: (context, GetCommunityMembersData? item, isSelected, isTrue) {
                                                          return Container(
                                                            margin: const EdgeInsets.symmetric(horizontal: 8),
                                                            decoration: isSelected
                                                                ? BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(5),
                                                                    color: Theme.of(context).colorScheme.secondaryContainer,
                                                                  )
                                                                : null,
                                                            child: ListTile(
                                                              selected: isSelected,
                                                              leading: Container(
                                                              width: 50,
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(color: Colors.grey),
                                                              ),
                                                              child: ClipOval(
                                                                child: item!.profilePicture != null && item.profilePicture!.isNotEmpty
                                                                    ? Image.network(
                                                                        item.profilePicture!,
                                                                        fit: BoxFit.cover,
                                                                        errorBuilder: (context, error, stackTrace) => SvgPicture.asset('assets/svg_icons/Broken.svg'),
                                                                      )
                                                                    : SvgPicture.asset('assets/svg_icons/user_2.svg'),
                                                              ),
                                                            ),
                                                              title: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    item.fullname ?? 'Unknown',
                                                                  ),
                                                                  Text(
                                                                    item.phone ?? '-',style: TextStyle(fontSize: 12.0),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        validator: (GetCommunityMembersData? value) {
                                                            if (controller.postMembersData.gender == 2 && controller.postMembersData.maritalStatus == 1 &&
                                                                value == null) {
                                                              return 'Spouse is required';
                                                            }
                                                            return null;
                                                          },
                                                        //  selectedItem: controller.communityMembersList.firstWhereOrNull(
                                                        //    (item) => item.id == controller.postMembersData.spouseId),
                                                        selectedItem: controller.postMembersData.spouseId != null
                                                                ? controller.communityMembersList.firstWhereOrNull(
                                                                    (item) => item.id == controller.postMembersData.spouseId)
                                                                : null,
                                                        compareFn: (i, GetCommunityMembersData? s) => i.fullname == s?.fullname,
                                                        itemAsString: (GetCommunityMembersData u) => u.fullname ?? '',
                                                        onChanged: (GetCommunityMembersData? data) {
                                                          if (data != null) {
                                                            // WidgetsBinding.instance.addPostFrameCallback((_) {
                                                            //   controller.postMembersData.spouseId = data.id;
                                                            //   controller.update();
                                                            // });
                                                            controller.postMembersData.spouseId = data.id;
                                                            controller.update();
                                                          }
                                                        },
                                                      ),
                                                    )),)
                              ]),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child : ResponsiveRow(columns: [
                    ResponsiveColumn(ResponsiveConstants().textFormField, child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32.0),
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () async {
                                if (formKey.currentState!.validate()) {
                                  print("prnt the isEditMode ::: ${controller.isEditMode}");
                                  controller.isLoading.value = true;

                                  if (controller.isEditMode && controller.communityMemberDetails.id != null) {
                                    print("print the edit Data :::: ${controller.communityMemberDetails.id}");
                                    await controller.editCommunityMember(controller.communityMemberDetails.id!);
                                  } else {
                                    await controller.addCommunityMember();
                                  }

                                  controller.isLoading.value = false;
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                        child: Text(controller.isEditMode ?  'Save Member' : 'Add Member' ,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),)
                  ])
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension XFileToFilePickerResult on XFile {
  Future<FilePickerResult> toFilePickerResult() async {
    final file = File(path);
    final bytes = await file.readAsBytes();

    final platformFile = PlatformFile(
      path: path,
      name: name,
      size: await length(),
      bytes: bytes,
    );

    return FilePickerResult([platformFile]);
  }
}