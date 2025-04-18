import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_loading_widget.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/master_repo.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/models/getCommunity_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniController extends GetxController {
  static MiniController get to => Get.find();
  var commonService = CommonService.instance;

  final RxInt _getCommunityCurrentPage = 1.obs;
  get getCommunityCurrentPage => _getCommunityCurrentPage.value;
  set getCommunityCurrentPage(value) => _getCommunityCurrentPage.value = value;

  final RxInt _getCommunityTotalPages = 1.obs;
  get getCommunityTotalPages => _getCommunityTotalPages.value;
  set getCommunityTotalPages(value) => _getCommunityTotalPages.value = value;

  final RxBool _getCommunityIsRefresh = false.obs;
  get getCommunityIsRefresh => _getCommunityIsRefresh.value;
  set getCommunityIsRefresh(value) => _getCommunityIsRefresh.value = value;

  final RxInt _getCommunityListCount = 0.obs;
  get getCommunityListCount => _getCommunityListCount.value;
  set getCommunityListCount(value) => _getCommunityListCount.value = value;

  final _getCommunityList = <GetCommunityData>[].obs;
  List<GetCommunityData> get getCommunityList => _getCommunityList;

  getCommunityLists({bool isLoading = true, String? itemId}) async {
    if (getCommunityIsRefresh) {
      _getCommunityList.value = <GetCommunityData>[];
      getCommunityCurrentPage = 1;
      isLoading == true ? showLoadingDialog() : null;
    } else {
      if (getCommunityCurrentPage > getCommunityTotalPages) {
        return false;
      }
    }
    final filterParams = <String, dynamic>{
      'page': getCommunityCurrentPage,
      'page_size': CommonService.instance.pageSize,
    };

    try {
      closeLoadingDialog();

      final data = await MiniRepo().getCommunityList(filterParams);

      if (data != null) {
        getCommunityListCount = data.count;
        _getCommunityList.value = [...getCommunityList, ...data.results ?? []];
        var seen = <String>{};
        List<GetCommunityData> filtered = _getCommunityList.where((field) => seen.add(field.id!.toString())).toList();
        _getCommunityList.value = filtered;
        getCommunityIsRefresh = false;

        getCommunityTotalPages = (getCommunityListCount / CommonService.instance.pageSize).ceil();
        getCommunityCurrentPage++;
        update();
        return true;
      } else {
        closeLoadingDialog();
        return false;
      }
    } catch (e) {
      closeLoadingDialog();
      debugPrint("users error: $e");
      // return false;
      // rethrow;
    }
  }
}