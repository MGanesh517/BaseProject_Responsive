
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_loading_widget.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_snackbar.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Routes/app_pages.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/models/mini_commonModel.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Models/get_community_detail.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Models/get_community_members_list.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Models/post_community_model.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Repo/community_repo.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Controller/profile_controller.dart';
import 'package:gowri_seva_sangam/Screen/dashboard_controller.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class CommunityMembersController extends GetxController {
  static CommunityMembersController get to => Get.find();
  var commonService = CommonService.instance;
  final dashboardController = Get.put(DashBoardControlelr());
  final profileController = Get.put(ProfileController());
    RefreshController refreshController = RefreshController(initialRefresh: false);
    



  final RxBool isGridView = true.obs;
  final RxBool isTableView = false.obs;


  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  void initializeMemberForm() {
    final args = Get.arguments;
    isEditMode = args != null && args['type'] == 'edit';
    if (isEditMode && args['id'] != null) {
      setupEditForm ==(args['id']);
    } else {
      disposeController();
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    initializeMemberForm();
    profileController.getUserDetails();
  }

  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      communityMembersIsRefresh = true;
      getCommunityMembersList();
      update();
    });
  }

  void inItDetailState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.getUserDetails();
      isEditMode = false;
      if (selectedDate != null) {
        date.text = DateFormat('dd MMM, yyyy').format(selectedDate!);
      }
      if (Get.arguments != null && Get.arguments['isEdit'] == true && Get.arguments['id'] != null) {
        isEditMode = true;
        setupEditForm(Get.arguments['id']);
      } else {
        postMembersData.fatherId = null;
        postMembersData.motherId = null;
        postMembersData.spouseId = null;
        isSpouseDropdownEnabled.value = false;
      }
      print("Spouse IDfgdfgdfg: ${postMembersData.spouseId}");
      print("Mother IDdfdfg: ${postMembersData.motherId}");
      print("Father ID         : ${postMembersData.fatherId}");
      update();
    });
  }

  initDetailScreenState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // searchController.clear();
      update();
    });
  }

  final List<MiniCommonModel> genderList = [
    MiniCommonModel(id: 1, name: "Male"),
    MiniCommonModel(id: 2, name: "Female"),
    MiniCommonModel(id: 3, name: "Others"),
  ];

  final List<MiniCommonModel> relationType = [
    MiniCommonModel(id: 1, name: "Father"),
    MiniCommonModel(id: 2, name: "Mother"),
    MiniCommonModel(id: 3, name: "Spouse"),
    MiniCommonModel(id: 4, name: "Son"),
    MiniCommonModel(id: 5, name: "Daughter"),
    MiniCommonModel(id: 6, name: "Siblings"),
  ];

  final List<MiniCommonModel> maritalChoices = [
    MiniCommonModel(id: 1, name: "Married"),
    MiniCommonModel(id: 2, name: "UnMarried"),
  ];

  final List<MiniCommonModel> relationChilds = [
    MiniCommonModel(id: 1, name: "Son"),
    MiniCommonModel(id: 2, name: "Daughter"),
  ];

  var isSpouseDropdownEnabled = false.obs;

  void updateMaritalStatus(int maritalStatusId) {
    isSpouseDropdownEnabled.value = maritalStatusId == 1;
  }
  
  TextEditingController searchController = TextEditingController();

  final RxInt _gender = 0.obs;
  get gender => _gender.value;
  set gender(value) => _gender.value = value;

  final RxInt _maritialStatus = 0.obs;
  get maritialStatus => _maritialStatus.value;
  set maritialStatus(value) => _maritialStatus.value = value;

  final RxInt _communityMembersCurrentPage = 1.obs;
  get communityMembersCurrentPage => _communityMembersCurrentPage.value;
  set communityMembersCurrentPage(value) => _communityMembersCurrentPage.value = value;

  final RxInt _communityMembersTotalPages = 1.obs;
  get communityMembersTotalPages => _communityMembersTotalPages.value;
  set communityMembersTotalPages(value) => _communityMembersTotalPages.value = value;

  final RxBool _communityMembersIsRefresh = false.obs;
  get communityMembersIsRefresh => _communityMembersIsRefresh.value;
  set communityMembersIsRefresh(value) => _communityMembersIsRefresh.value = value;

  final RxInt _communityMembersListCount = 0.obs;
  get communityMembersListCount => _communityMembersListCount.value;
  set communityMembersListCount(value) => _communityMembersListCount.value = value;

  final _communityMembersList = <GetCommunityMembersData>[].obs;
  List<GetCommunityMembersData> get communityMembersList => _communityMembersList;

  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController searchExpSheet = TextEditingController();

  getCommunityMembersList({bool isLoading = true, String? search, int? phone, String? community}) async {
    if (communityMembersIsRefresh) {
      _communityMembersList.value = <GetCommunityMembersData>[];
      communityMembersCurrentPage = 1;
      // showLoadingDialog();
    } else {
      if (communityMembersCurrentPage > communityMembersTotalPages) {
        return false;
      }
    }
    final filterParams = <String, dynamic>{
      'page': communityMembersCurrentPage,
      'page_size': CommonService.instance.pageSize,
      'search': search,
      'phone': phone,
      'community': community,
      if (fromDate.text != '') 'start_date': fromDate.text,
      if (toDate.text != '') 'end_date': toDate.text,
      if (gender != 0) 'gender': gender,
      if (maritialStatus != 0) 'marital_status': maritialStatus,
    };

    try {
      final data = await CommunityRepo().getCommunityMembersList(filterParams);

      if (data != null) {
        communityMembersListCount = data.count;
        _communityMembersList.value = [...communityMembersList, ...data.results ?? []];
        var seen = <String>{};
        List<GetCommunityMembersData> filtered = _communityMembersList.where((field) => seen.add(field.id!.toString())).toList();
        _communityMembersList.value = filtered;
        communityMembersIsRefresh = false;

        communityMembersTotalPages = (communityMembersListCount / CommonService.instance.pageSize).ceil();
        communityMembersCurrentPage++;
        update();
        return true;
      } else {
        closeLoadingDialog();
        return false;
      }
    } catch (e) {
      closeLoadingDialog();
      debugPrint("users error communityMembers: $e");
      // return false;
      rethrow;
    }
  }

  final _postMembersData = PostCommunityData().obs;
  PostCommunityData get postMembersData => _postMembersData.value;
  set postMembersData(value) => _postMembersData.value = value;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController aadharNumber = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController date = TextEditingController();
  final RxBool isLate = false.obs;
  // static RxBool isEditMode = false.obs;

  final RxBool _isEditMode = false.obs;
  bool get isEditMode => _isEditMode.value;
  set isEditMode(value) => _isEditMode.value = value;

  final RxBool _submit = false.obs;
  get submit => _submit.value;
  set submit(value) => _submit.value = value;

  DateTime? selectedDate;
  RxString? fatherIdShow = ''.obs;

  var isLoading = false.obs;

addCommunityMember() async {
  submit = true;

  var postData = {
    "email": emailController.text,
    if (phoneNumberController.text != '')  "phone": phoneNumberController.text,
    "adhar_no": aadharNumber.text,
    "address": addressController.text,
    // "community_id": postMembersData.communityId,
    // "password": passwordController.text,
    "is_late": isLate.value,
    "first_name": firstNameController.text,
    "last_name": lastNameController.text,
    if (postMembersData.gender != null)  "gender": postMembersData.gender,
    if (selectedDate != null) "dob": DateFormat('yyyy-MM-dd').format(selectedDate!),
    if (postMembersData.maritalStatus != null)  "marital_status": postMembersData.maritalStatus,
    "father_id": postMembersData.fatherId,
    // "mother_id": postMembersData.motherId,
    "spouse_id": postMembersData.maritalStatus == 1
        ? postMembersData.spouseId
        : null,
  };

  try {
    print("Print PostData ===>>> ${jsonEncode(postData)}");
        print("Printing the selectedImageFile $selectedImageFile");
    var data = await CommunityRepo().addCommunityMember(postData);

    if (data != null) {
      _communityMemberDetails.value = data;

      if (selectedImageFile != null) {
        print("Printing the selectedImageFile $selectedImageFile");
        print("Print The communityMemberDetails.id :::: ${communityMemberDetails.id}");
        await updateProfilePic(File(selectedImageFile!.path), communityMemberDetails.id);
      }

      showSnackBar(title: 'Success!', message: 'Member added successfully.');

      disposeController();
      communityMembersIsRefresh = true;
      await getCommunityMembersList();
      // communityMembersIsRefresh = true;
      // dashboardController.selectedIndex = 0;
      Get.toNamed(Routes.dashBoardView);
      // await getCommunityMemberDetailView(communityMemberDetails.id, navigation: false);
    }
  } catch (e) {
    print("add Community ::::: $e");
    submit = false;
    debugPrint("Api Error Response: $e");
    closeLoadingDialog();
  }
}

  final _communityMemberDetails = GetCommunityMemberDetail().obs;
  GetCommunityMemberDetail get communityMemberDetails => _communityMemberDetails.value;
  set communityMemberDetails(value) => _communityMemberDetails.value = value;

  getCommunityMemberDetailView(id, {bool navigation = true}) async {
    showLoadingDialog();
    try {
      final data = await CommunityRepo().getCommunityMemberDetail(id);
      if (data != null) {
        _communityMemberDetails.value = data;
        update();
        closeLoadingDialog();
        navigation == true ? Get.toNamed(Routes.communityMembersViewById) : null;
      } else {
        debugPrint("Api Error Response error:: ");
        closeLoadingDialog();
        return false;
      }
    } catch (e) {
      closeLoadingDialog();

      debugPrint("Api  Response error:: $e ");
      rethrow;
    }
  }

  deleteUser(id, {bool navigation = true}) async {
    showLoadingDialog();
    try {
          var result = await CommunityRepo().deleteUser(id);
                      if (result != null) {
                        // Get.back();
                        
                        showSnackBar(
                          title: 'Success!',
                          message: 'User Deleted successfully.',
                          icon: const Icon(Icons.check, color: Colors.green),
                        );
                        update();
                        communityMembersIsRefresh = true;
                        closeLoadingDialog();
                        navigation == true ? Get.toNamed(Routes.membersListScreen) : null;
                        // onDeleteSuccess?.call();
                      } else {
                        // Get.snackbar(
                        //   'Error',
                        //   'Failed to delete user',
                        //   snackPosition: SnackPosition.BOTTOM,
                        // );
                        closeLoadingDialog();
                      }
                    } catch (e) {
      closeLoadingDialog();
      debugPrint("Api  Response error:: $e ");
      rethrow;
    }
  }

  editCommunityMember(String? id) async {
    if (id == null) {
      showSnackBar(
        title: 'Error!',
        message: 'Member ID is missing',
        icon: const Icon(Icons.error, color: Colors.red),
      );
      return;
    }
    
    submit = true;
    showLoadingDialog();
    
    var updateData = {
      "email": emailController.text,
    // if (phoneNumberController.text != '')  "phone": phoneNumberController.text,
      "phone": phoneNumberController.text,
      "adhar_no": aadharNumber.text,
      "address": addressController.text,
      "is_late": isLate.value,
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "gender": postMembersData.gender,
    if (selectedDate != null) "dob": DateFormat('yyyy-MM-dd').format(selectedDate!),
    if (postMembersData.maritalStatus != null)  "marital_status": postMembersData.maritalStatus,
      "father_id": postMembersData.fatherId,
      "mother_id": postMembersData.motherId,
      "spouse_id": postMembersData.maritalStatus == 1
          ? postMembersData.spouseId
          : null,
      };
    
    try {
      print("Update Data ===>>> ${jsonEncode(updateData)}");
      print("Updating member with ID: $id");
      final data = await CommunityRepo().updateCommunityMember(updateData, id);
      closeLoadingDialog();
      if (data != null) {
        _communityMemberDetails.value = data;

        if (selectedImageFile != null) {
          print("Updating profile picture for ID: $id");
          await updateProfilePic(File(selectedImageFile!.path), id);
        }
        
        showSnackBar(
          title: 'Success!',
          message: 'Member updated successfully.',
          icon: const Icon(Icons.check, color: Colors.green),
        );
        
        disposeController();
        communityMembersIsRefresh = true;
        await getCommunityMembersList();
        Get.toNamed(Routes.dashBoardView);
      }
    } catch (e) {
      submit = false;
      closeLoadingDialog();
      debugPrint("Edit Member API Error: $e");
    }
  }

void setupEditForm(String id) {
  getCommunityMemberDetailView(id, navigation: false).then((_) {
    firstNameController.text = communityMemberDetails.firstName ?? '';
    lastNameController.text = communityMemberDetails.lastName ?? '';
    emailController.text = communityMemberDetails.email ?? '';
    phoneNumberController.text = communityMemberDetails.phone ?? '';
    aadharNumber.text = communityMemberDetails.adharNo ?? '';
    addressController.text = communityMemberDetails.address ?? '';
    postMembersData.gender = communityMemberDetails.gender;
    postMembersData.maritalStatus = communityMemberDetails.maritalStatus;
    postMembersData.isLate = communityMemberDetails.isLate;

    if (communityMemberDetails.dob != null) {
      try {
        // selectedDate = DateTime.parse(communityMemberDetails.dob!);
        date.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      } catch (e) {
        print("Error parsing date: $e");
      }
    }

    if (communityMemberDetails.profilePicture != null) {
      networkImageUrl = communityMemberDetails.profilePicture;
    }

      postMembersData.fatherId = communityMemberDetails.relations?.firstWhereOrNull(
        (relation) => relation.relationtypeName == "Father",
      )?.relationTo?.id;
      
      postMembersData.motherId = communityMemberDetails.relations?.firstWhereOrNull(
        (relation) => relation.relationtypeName == "Mother",
      )?.relationTo?.id;
      
      postMembersData.spouseId = communityMemberDetails.relations?.firstWhereOrNull(
        (relation) => relation.relationtypeName == "Wife" || relation.relationtypeName == "Husband",
      )?.relationTo?.id;

      isSpouseDropdownEnabled.value = postMembersData.spouseId == null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  });
}

    // FATHER = 1
    // MOTHER = 2
    // SPOUSE = 3
    // SON = 4
    // DAUGHTER = 5
    // SIBLINGS = 6
    // RELATION_CHOICES = [
    //         (FATHER, 'Father'),
    //         (MOTHER, 'Mother'),
    //         (SPOUSE, 'Spouse'),
    //         (SON, 'Son'),
    //         (DAUGHTER, 'Daughter'),
    //         (SIBLINGS, 'Siblings')
    //     ]


  void disposeController() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    aadharNumber.clear();
    addressController.clear();
    passwordController.clear();
    date.clear();
    networkImageUrl = null;
    selectedImageFile = null;
    isLate.value = false;
    selectedDate = DateTime.now();

    postMembersData = PostCommunityData();
    postMembersData.fatherId = null;
    postMembersData.motherId = null;
    postMembersData.spouseId = null;

    update();
  }

  File? selectedImageFile;
  String? networkImageUrl = "";
  
  updateProfilePic(File picObj, id) async {
    try {
      print("Print the PICOBJ ::::::::: $picObj , $id");
      final data = await CommunityRepo().addProfilePicAttachments(picObj, id);

      if (data != null) {
        Get.back();
        // showSnackBar(
        //   title: "Success..!",
        //   message: 'Profile pic updated',
        //   icon: const Icon(Icons.check, color: Colors.green),
        // );
        debugPrint("Api Error Response error:: ");
        // getCommunityMembersList();

        return true;
      }
    } catch (e) {
      submit = false;
      return false;
    }
  }
}
