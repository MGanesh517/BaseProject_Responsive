// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_loading_widget.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_snackbar.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_services.dart';
import 'package:gowri_seva_sangam/Common%20Components/session_manager.dart';

import '../Routes/app_pages.dart';

class HttpUtils {
  // Global dio object
  static Dio dio = Dio();
  static Dio dio2 = Dio();

  // Dev Server
  static const String API_PREFIX = 'https://communityapp.dev.cluster.absol.in/';
  // static const String API_PREFIX = 'http://192.168.1.117:8000/';

  // Live Server
  // static const String API_PREFIX = 'https://gaiafresh.absol.in/';

  //Staging Server
  // static const String API_PREFIX = 'https://communityapp.staging.cluster.absol.in/';

  //Testing Server
  // static const String API_PREFIX = 'http://communityapp.testing.cluster.absol.in/';

  static const Duration connectTimeOut = Duration(milliseconds: 100000);
  static const Duration receiveTimeOut = Duration(milliseconds: 50000);

  // Field names mapping
  static Map<String, String> fieldNames = {};

  static Future<void> initialize() async {
    // Load field names from mapping.json
    String jsonString = await rootBundle.loadString('assets/mapping.json');
    fieldNames = Map<String, String>.from(json.decode(jsonString));
  }

  static setToken() {
    dio = Dio();
    getInstance();
  }

  static Dio getInstance() {
    dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${CommonService.instance.accessToken}";
    dio.options.baseUrl = API_PREFIX;
    dio.options.connectTimeout = connectTimeOut;
    dio.options.receiveTimeout = receiveTimeOut;

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        debugPrint("request: ${request.path}");
        if (CommonService.instance.accessToken != '') {
          request.headers['Authorization'] = 'Bearer  ${CommonService.instance.accessToken}';
        }
        return handler.next(request); // continue
      },
      onResponse: (response, handler) {
        debugPrint("onResponse statusCode  $response");
        return handler.next(response); // continue
      },
      onError: (DioException error, handler) async {
        debugPrint("error statusCode  $error");
        if (error.response != null && error.response?.statusCode == 401) {
          await _handleUnauthorizedError(error, handler);
        } else if (error.response != null && error.response?.statusCode == 500 ||
            error.response?.statusCode == 501 ||
            error.response?.statusCode == 503) {
          showSnackBar(
            title: "Request Failed",
            message: "Getting Server Error",
            icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
          );
        } else {
          print("Print Error MSG ::::$error");
          _handleOtherErrors(error, handler);
        }
      },
    ));

    return dio;
  }

  static Future<void> _handleUnauthorizedError(DioException error, ErrorInterceptorHandler handler) async {
    try {
      if (CommonService.instance.refreshToken != '') {
        final refreshToken = CommonService.instance.refreshToken;
        debugPrint("refreshToken: $refreshToken");
        dio2 = Dio();
        dio2.options.headers['content-Type'] = 'application/json';
        dio2.options.headers["Authorization"] = "Bearer ${CommonService.instance.accessToken}";
        dio2.options.connectTimeout = connectTimeOut;
        dio2.options.receiveTimeout = receiveTimeOut;

        final refreshResponse = await dio2.post("${API_PREFIX}users/token/refresh/", data: {
          "refresh": refreshToken,
          "device_uuid": CommonService.instance.deviceId,
          "device_name": CommonService.instance.deviceName,
          "device_type": CommonService.instance.deviceType == 'android' ? 1 : 2
        });

        if (refreshResponse.statusCode == 200) {
          debugPrint("Refreshed Access Token: ${refreshResponse.data['access']}");
          error.requestOptions.headers["Authorization"] = "Bearer ${refreshResponse.data['access']}";
          CommonService.instance.accessToken = refreshResponse.data['access'];
          final opts = Options(method: error.requestOptions.method, headers: error.requestOptions.headers);
          final cloneReq = await dio.request(
            error.requestOptions.path,
            options: opts,
            data: error.requestOptions.data,
            queryParameters: error.requestOptions.queryParameters,
          );
          return handler.resolve(cloneReq);
        } else {
          _handleTokenRefreshFailure();
          return handler.reject(error);
        }
      }
    } catch (e) {
      _handleTokenRefreshFailure();
      return handler.reject(error);
    }
  }

  static void _handleTokenRefreshFailure() {
    CommonService.instance.accessToken = '';
    CommonService.instance.refreshToken = '';
    SessionManager.setAccessToken('');
    SessionManager.setRefreshToken('');
    closeLoadingDialog();
    Get.toNamed(Routes.loginView);
  }

  static void _handleOtherErrors(DioException error, ErrorInterceptorHandler handler) {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    closeLoadingDialog();
    if (error.response != null) {
      String errorMessage = formatErrorMessage(error.response!.data);
      showSnackBar(
        title: "Request Failed",
        message: errorMessage,
        icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
      );
    } else {
      showSnackBar(
        title: "Error",
        message: "An unexpected error occurred.",
        icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
      );
    }
    return handler.reject(error);
  }

  static String formatErrorMessage(Map<String, dynamic> errorObj, [Map<String, String>? errVar]) {
    List<String> errorMessages = [];
    Map<String, List<String>> subKeyErrors = {};
    int count = 1;

    Map<String, String> optionalVariable = errVar ?? fieldNames;

    if (errorObj.containsKey('detail') && errorObj['detail'] is String) {
      errorMessages.add(errorObj['detail']);
    }

    errorObj.forEach((key, value) {
      if (key == 'detail') return;

      if (value is List && value.isNotEmpty) {
        if (value.first is String) {
          // String formattedKey = optionalVariable[key] ?? key;
          errorMessages.add('$count. ${value.first}.');
          count++;
        } else if (value.any((item) => item is Map<String, dynamic>)) {
          for (var item in value) {
            if (item is Map<String, dynamic>) {
              item.forEach((subKey, subValue) {
                if (subValue is List && subValue.isNotEmpty) {
                  String formattedSubKey = optionalVariable[subKey] ?? subKey;

                  if (!subKeyErrors.containsKey(formattedSubKey)) {
                    subKeyErrors[formattedSubKey] = [];
                  }
                  subKeyErrors[formattedSubKey]!.addAll(subValue.cast<String>());
                }
              });
            }
          }
          for (var subKey in subKeyErrors.keys) {
            errorMessages.add('$count. Items:');
            for (var idx = 0; idx < subKeyErrors[subKey]!.length; idx++) {
              errorMessages.add(' S.No ${idx + 1}. $subKey - ${subKeyErrors[subKey]![idx]}');
            }
            count++;
          }
        }
      }
    });

    return errorMessages.join('\n');
  }

  static Dio postInstance() {
    dio = Dio();
    dio.options.baseUrl = API_PREFIX;
    dio.options.connectTimeout = connectTimeOut;
    dio.options.receiveTimeout = receiveTimeOut;
    dio.options.headers['content-Type'] = 'application/json';

    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
