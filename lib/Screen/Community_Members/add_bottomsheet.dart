
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/add_attachment_dialog_box.dart' show AddAttachmentsAlertDialog;
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Controller/community_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/mini_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/models/mini_commonModel.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Models/get_community_members_list.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Controller/profile_controller.dart';
import 'package:gowri_seva_sangam/Utils/photo_view_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddChildMembersBottomSheet extends StatefulWidget {
  final String? presetFatherId;
  const AddChildMembersBottomSheet({super.key, this.presetFatherId});

  @override
  State<AddChildMembersBottomSheet> createState() => _AddChildMembersBottomSheetState();
}

class _AddChildMembersBottomSheetState extends State<AddChildMembersBottomSheet> {
  final controller = Get.put(CommunityMembersController());
  final profileController = Get.put(ProfileController());
  final miniController = Get.put(MiniController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final focusNodes = Iterable<int>.generate(6).map((_) => FocusNode()).toList();

  void initState() {
    super.initState();
    
    // If a preset father ID is provided, set it in the controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.presetFatherId != null) {
        controller.postMembersData.fatherId = widget.presetFatherId;
        controller.update();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityMembersController>(
        // initState: (_) => CommunityMembersController.to.inItDetailState(),
        builder: (va) => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 100.0),
            child: Form(
              key: formKey,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                                                              alignment: Alignment.bottomRight,
                                                              children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        PhotoViewPage(
                                          type: controller.selectedImageFile != null ? 'local' : 'network',
                                          photo: controller.selectedImageFile != null ? controller.selectedImageFile!.path : (controller.networkImageUrl ?? ""),
                                        ),
                                        transition: Transition.downToUp,
                                        duration: const Duration(milliseconds: 300),
                                      );
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Container(
                                            decoration: BoxDecoration(shape: BoxShape.circle,
                                            border: Border.all(color: Theme.of(context).colorScheme.outline)
                                            ),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 3)),
                                              // child: controller.userObj.data != null
                                              //     ? controller.userObj.data!.profilepic != null
                                              //         ?
                                                  child: ClipOval(
                                                          child: controller.selectedImageFile != null
                                                            ? Image.file(
                                                                controller.selectedImageFile!,
                                                                height: double.infinity,
                                                                width: double.infinity,
                                                                alignment: Alignment.center,
                                                                fit: BoxFit.cover,
                                                              )
                                                            : Image.network(
                                                                controller.networkImageUrl ?? "assets/svg_icons/Broken.svg",
                                                                height: double.infinity,
                                                                width: double.infinity,
                                                                alignment: Alignment.center,
                                                                fit: BoxFit.cover,
                                                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                                  if (loadingProgress == null) {
                                                                    return child;
                                                                  }
                                                                  return Center(
                                                                    child: CircularProgressIndicator(
                                                                      value: loadingProgress.expectedTotalBytes != null
                                                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                                          : null,
                                                                    ),
                                                                  );
                                                                },
                                                                errorBuilder: (BuildContext context, Object? exception, StackTrace? stackTrace) {
                                                                  return Center(
                                                                    // child: Icon(
                                                                    //   Icons.broken_image,
                                                                    //   size: (40),
                                                                    // ),
                                                                    child: SvgPicture.asset('assets/svg_icons/user_2.svg'),
                                                                  );
                                                                },
                                                              ),
                                                      )
                                            ))),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.dialog(
                                        AddAttachmentsAlertDialog(
                                          onTapCamera: () async {
                                            await CommonService.camerImagePicker().then((value) async {
                                              print("Printing the onTapCamera image Value ::: => $value");
                                              if (value != null) {
                                                final FilePickerResult result = await value.toFilePickerResult();
                                                controller.selectedImageFile = File(result.files.single.path!);
                                              }
                                              controller.update();
                                            });
                                            Get.back();
                                          },
                                          onTapGAllery: () async {
                                            final XFile? result = await ImagePicker().pickImage(source: ImageSource.gallery);
                                            if (result != null) {
                                              setState(() {
                                                print("Print File Path ::::::: ${result.path}");
                                                controller.selectedImageFile = File(result.path);
                                                controller.networkImageUrl = null;
                                              });
                                            }
                                            Get.back();
                                          },
                                          onTapDocuments: () async {
                                            await CommonService.documentPicker().then((value) {
                                              print("Printing the onTapDocument image Value ::: => $value");
                                              controller.selectedImageFile = File(value!.files.single.path!);
                                              controller.update();
                                            });
                                            Get.back();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).colorScheme.primaryContainer,
                                        border: Border.all(color: Colors.white, width: 2)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: Theme.of(context).colorScheme.primary,
                                          size: 16,
                                        ),
                                        // child: SvgPicture.asset('assets/svg_icons/camera.svg'),
                                      ),
                                    ),
                                  )
                                  ],
                                ),
                      ),
                                    SizedBox(height: Get.height * 18 / 896),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CommonComponents.defaultTextFormField(
                                            context,
                                            controller: controller.firstNameController,
                                            textInputAction: TextInputAction.next,
                                            keyboardType: TextInputType.text,
                                            title: 'First Name',
                                            hintText: 'Enter First Name',
                                            focusNode: Platform.isIOS ? focusNodes[0] : null,
                                            validator: (value) => value!.isEmpty ? 'Name is required' : null,
                                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9A-Za-z ,./?@&()!%*]'))],
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 18 / 896),
                                        Expanded(
                                          child: CommonComponents.defaultTextFormField(
                                            context,
                                            controller: controller.lastNameController,
                                            textInputAction: TextInputAction.next,
                                            keyboardType: TextInputType.text,
                                            hintText: 'Enter Surname',
                                            focusNode: Platform.isIOS ? focusNodes[1] : null,
                                            title: 'Surname',
                                            validator: (value) => value!.isEmpty ? 'Surname is required' : null,
                                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9A-Za-z ,./?@&()!%*]'))],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Get.height * 10 / 896),
                                    CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(
                                      context,
                                      title: "Relation",
                                      hintText: 'Select Relation',
                                      
                                      showBottomSheet: MediaQuery.of(context).size.width <= 600 ? true : false,
                                      items: (filter, infiniteScrollProps) async {
                                        miniController.getCommunityIsRefresh = true;
                                                              
                                        return controller.relationChilds;
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
                                      // selectedItem: controller.relationChilds.firstWhereOrNull(
                                      //   (item) => item.id == controller.postMembersData.gender,
                                      // ),
                                      validator: (MiniCommonModel? value) {
                                        if (value == null || value.name == null || value.name!.isEmpty) {
                                          return 'Relation is required';
                                        }
                                        return null;
                                      },
                                      compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                      itemAsString: (MiniCommonModel u) => u.name ?? '',
                                      onChanged: (MiniCommonModel? data) {
                                        if (data != null) {
                                        print("Print the Relation :::: ===>>> ${data!.id}");
                                        controller.postMembersData.gender = data.id;
                                        controller.update();
                                        }
                                      },
                                    ),
                                    SizedBox(height: Get.height * 10 / 896),
                                    Row(
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
                                        print("Print the gender :::: ===>>> ${data!.id}");
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
                                    ),
                                    
                                    SizedBox(height: Get.height * 10 / 896),
                                                              CommonComponents.defaultTextFormField(
                                      context,
                                      controller: controller.emailController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      focusNode: Platform.isIOS ? focusNodes[2] : null,
                                      hintText: 'Enter Email Id',
                                      title: 'Email',
                                    ),
                                    SizedBox(height: Get.height * 10 / 896),
                                                              CommonComponents.defaultTextFormField(
                                      context,
                                      controller: controller.phoneNumberController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.phone,
                                      hintText: 'Enter Mobile Number',
                                      focusNode: Platform.isIOS ? focusNodes[3] : null,
                                      title: 'Mobile Number',
                                      maxLength: 10,
                                  validator: (value) {
                                      if (controller.isLate.value == true) {
                                        return null;
                                      }
                                      return value!.isEmpty ? 'Mobile Number is required' : null;
                                    },
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                                    ),
                                    SizedBox(height: Get.height * 10 / 896),
                                    CommonComponents.defaultTextFormField(
                                      context,
                                      controller: controller.aadharNumber,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      focusNode: Platform.isIOS ? focusNodes[4] : null,
                                      maxLength: 12,
                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                                      hintText: 'Enter Aadhar Number',
                                      title: 'Aadhar Number',
                                    ),
                                    SizedBox(height: Get.height * 10 / 896),
                                    CommonComponents.defaultTextFormField(
                                      context,
                                      // suffixIcon: SvgPicture.asset('assets/svg_icons/Calendar.svg', height: 20, width: 20),
                                      onTap: () async {
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
                                    ),
                                    SizedBox(height: Get.height * 10 / 896),
                                    CommonComponents.defaultTextFormField(
                                                    context,
                                                    hintText: 'Enter Address',
                                                    title: 'Address',
                                                focusNode: Platform.isIOS ? focusNodes[5] : null,
                                                    textInputAction: TextInputAction.done,
                                                    controller: controller.addressController,
                                                    keyboardType: TextInputType.multiline,
                                                  ),
                                    SizedBox(height: Get.height * 10 / 896),
                                                                
                                                          Obx(() => Visibility(
                                                             visible: controller.isSpouseDropdownEnabled.value || controller.postMembersData.maritalStatus == 1 || controller.postMembersData.spouseId != null,
                                                             child: Row(
                                                               children: [
                                                                 Expanded(
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
                                                                                     errorBuilder: (context, error, stackTrace) => SvgPicture.asset('assets/svg_icons/user_active.svg'),
                                                                                   )
                                                                                 : SvgPicture.asset('assets/svg_icons/user_active.svg'),
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
                                                                     selectedItem: controller.communityMembersList.firstWhereOrNull(
                                                                       (item) => item.id == controller.postMembersData.spouseId),
                                                                     compareFn: (i, GetCommunityMembersData? s) => i.fullname == s?.fullname,
                                                                     itemAsString: (GetCommunityMembersData u) => u.fullname ?? '',
                                                                     onChanged: (GetCommunityMembersData? data) {
                                                                      if (data != null) {
                                                                        WidgetsBinding.instance.addPostFrameCallback((_) {
                                                                          controller.postMembersData.spouseId = data.id;
                                                                          controller.update();
                                                                        });
                                                                      }
                                                                    },
                                                                   ),
                                                                 ),
                                                               ],
                                                             ),
                                                           )),
                ],
              ),
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.close, color: Theme.of(context).iconTheme.color),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32.0),
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                        if (formKey.currentState!.validate()) {
                          controller.isLoading.value = true;

                          if (controller.isEditMode && controller.communityMemberDetails.id != null) {
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
                child: Text(
                  'Save Member Details',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
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