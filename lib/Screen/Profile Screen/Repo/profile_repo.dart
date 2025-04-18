import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Model/user_model.dart';
import 'package:gowri_seva_sangam/Utils/http_utils.dart';

class ProfileRepo {
  getUserDetails() async {
    try {
      var response = await HttpUtils.getInstance().get("/users/iamuser/");

      if (response.statusCode == 200) {
        return GetUserProfileData.fromJson(response.data as Map<String, dynamic>);
      } else {
        return null;
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
  }

  changePassword(data) async {
    try {
      var response = await HttpUtils.getInstance().put("/users/changepassword/", data: data);
      if (response.statusCode == 200) {
        debugPrint("printing Response: ${response.data.toString()}");
        return true;
      } else {
        debugPrint("printing Error: ${response.toString()}");
        return false;
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }
}
