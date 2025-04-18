import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Screen/login/Model/login_user_model.dart';
import 'package:gowri_seva_sangam/Utils/http_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginRepo {
  Future<LoginModel?> login(
      String? username, String? password, String? deviceId, String? deviceName, String? deviceType, String? fcmToken, String? apnsToken) async {
    var otpObj = jsonEncode({
      'username': username,
      'password': password,
      'user_type': 'User',
      'device_uuid': deviceId,
      'device_name': deviceName,
      'device_fcmtoken': fcmToken,
      'device_type': deviceType == 'android' ? "1" : kIsWeb ? "3" : "2",
      'device_apntoken': apnsToken
    });
    try {
      var response = await HttpUtils.postInstance().post(
        "/users/login/",
        data: otpObj,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.toString());
        return LoginModel.fromJson(response.data as Map<String, dynamic>);
      }

      return null;
    } on DioException catch (e) {
      debugPrint('error message $e');

      if (e.response != null && e.response!.statusCode == 500 || e.response!.statusCode == 404) {
        throw e.message.toString();
      } else {
        if (e.response != null) {
          String errorMessage = '';

          e.response!.data.forEach((key, value) {
            errorMessage += '$key: $value';
          });

          throw errorMessage;
          // throw e.response!.data['message'];
        } else {
          throw "Some Thing Went Wrong";
        }
      }
    }
  }

  Future<bool> userLogout(String? refresh, String? deviceId, String? deviceType) async {
    debugPrint("Printing refresh: $refresh");
    debugPrint("Printing access: ${CommonService.instance.accessToken}");
    var refreshObj = jsonEncode({'refresh': refresh, 'device_uuid': deviceId, 'device_type': deviceType == 'android' ? 1 : 2});
    debugPrint("Printing refresh: $refreshObj");

    try {
      var response = await HttpUtils.getInstance().post("/users/logout/", data: refreshObj);
      debugPrint("response.toString()::::::::::::::::::${response.statusCode}");
      if (response.statusCode == 204) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  // resendOtp(String username) async {
  //   var userObj = jsonEncode({'mobile': username});
  //   try {
  //     var response = await HttpUtils.postInstance().post("/system/temp_otp/resend/", data: userObj);
  //     if (response.statusCode == 200) {
  //       debugPrint(response.toString());

  //       return response.data;
  //     }
  //     return response.data;
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     if (e.response != null && e.response!.statusCode == 500 || e.response!.statusCode == 404) {
  //       throw e.message.toString();
  //     } else {
  //       if (e.response != null) {
  //         String errorMessage = '';

  //         e.response!.data.forEach((key, value) {
  //           errorMessage += '$key: ${value[0]}';
  //         });

  //         throw errorMessage;
  //       } else {
  //         throw "Some Thing Went Wrong";
  //       }
  //     }
  //   }
  // }

  // resetPassword(data) async {
  //   print("Print MOvn:$data");
  //   try {
  //     var response = await HttpUtils.postInstance().put("/users/resetpassword/", data: data);
  //     print('object ${response.statusCode}');
  //     if (response.statusCode == 200) {
  //       return response.data;
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
/************************************************/

  getPermissions() async {
    try {
      var response = await HttpUtils.getInstance().get("/users/userpermissions/");
      if (response.statusCode == 200) {
        return response.data;
      } else {}
    } catch (error) {
      // throw error;
      rethrow;
    }
  }
}
