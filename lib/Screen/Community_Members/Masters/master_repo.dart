import 'dart:io';

import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/models/getCommunity_list.dart';
import 'package:gowri_seva_sangam/Utils/http_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MiniRepo {
  // Future<MiniModelCityList?> getMiniCitiesList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/city/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return MiniModelCityList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<MasterCountryList?> getMiniCountryList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/country/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return MasterCountryList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<MasterStateList?> getMiniStateList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/state/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return MasterStateList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  Future<GetCommunityList?> getCommunityList(filterParams) async {
    try {
      var response = await HttpUtils.getInstance().get("/masters/community/", queryParameters: filterParams);

      if (response.statusCode == 200) {
        return GetCommunityList.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }

  // Future<GetMiniUnitsList?> getMiniUnitsList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/unit/mini/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetMiniUnitsList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetBatchMiniList?> getMiniBatchList(filterParams) async {
  //   print('filter $filterParams');
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/batch/mini/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetBatchMiniList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetWareHouseList?> getMiniWareHouseList(filterParams, projectId) async {
  //   try {
  //     // var response = await HttpUtils.getInstance().get("/masters/warehouse/mini/", queryParameters: filterParams);
  //     var response = await HttpUtils.getInstance().get("/masters/warehouse/list/$projectId/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetWareHouseList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetLocationsMiniList?> getMiniLocationsList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/location/mini/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetLocationsMiniList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetDepartmentsMiniList?> getMiniDepartmentsList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/mini/departments/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetDepartmentsMiniList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetExpenditureTypeList?> getMiniExpenditureTypeList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/expendituretype/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetExpenditureTypeList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetMiniExpensesList?> getMiniExpensesList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/mini/expances/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetMiniExpensesList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetUsersMiniList?> getMiniUsersList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/users/userdepartments/mini/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetUsersMiniList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetStockAgainstBatchList?> getStockAgainstBatchList(
  //   filterParams,
  //   projectId,
  //   wareHouseId,
  //   itemId,
  // ) async {
  //   try {
  //     var response =
  //         await HttpUtils.getInstance().get("/projectmanagement/stockagainstbatch/$projectId/$wareHouseId/$itemId/", queryParameters: filterParams);

  //     if (response.statusCode == 200) {
  //       return GetStockAgainstBatchList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // getItemAvailableQtyDetails(projectId, wareHouseId, itemId) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/projectmanagement/stockwithoutbatch/$projectId/$wareHouseId/$itemId/");

  //     if (response.statusCode == 200) {
  //       return GetItemAvailableStockQuantity.fromJson(response.data as Map<String, dynamic>);
  //     } else {
  //       return null;
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  // }

  // Future<GetVendorsMiniList?> getVendorsList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/masters/mini/vendors/", queryParameters: filterParams);
  //     print('object ${response.statusCode}');

  //     if (response.statusCode == 200) {
  //       return GetVendorsMiniList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetMiniMilestonesList?> getMiniMilestonesList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/taskmanagement/milestone/mini/", queryParameters: filterParams);
  //     print('object ${response.statusCode}');

  //     if (response.statusCode == 200) {
  //       return GetMiniMilestonesList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  // Future<GetMiniProjectGroupsList?> getMiniProjectGroupsList(filterParams) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/projectmanagement/projectgroup/mini/", queryParameters: filterParams);
  //     print('object ${response.statusCode}');

  //     if (response.statusCode == 200) {
  //       return GetMiniProjectGroupsList.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }
}
