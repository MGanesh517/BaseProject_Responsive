import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Models/get_community_detail.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Models/get_community_members_list.dart';
import 'package:gowri_seva_sangam/Utils/http_utils.dart';

class CommunityRepo {
  Future<GetCommunityMembersList?> getCommunityMembersList(filterParams) async {
    try {
      var response = await HttpUtils.getInstance().get("/users/communitymember/list/", queryParameters: filterParams);

      if (response.statusCode == 200) {
        return GetCommunityMembersList.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }

  getCommunityMemberDetail(id) async {
    try {
      var response = await HttpUtils.getInstance().get("/users/communitymember/${id}");

      if (response.statusCode == 200) {
        return GetCommunityMemberDetail.fromJson(response.data as Map<String, dynamic>);
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

  addCommunityMember(data) async {
    try {
      var response = await HttpUtils.getInstance().post("/users/communitymember/create/", data: data);
      print("Print Response Dtaqa ;;;;;; ${response.data}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        return GetCommunityMemberDetail.fromJson(response.data as Map<String, dynamic>);
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

  addProfilePicAttachments(File file, String? id) async {
    if (id == null) return null;

    FormData attachmentData = FormData.fromMap({
      "profile_picture": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      "id": id,
    });

    try {
      var response = await HttpUtils.getInstance().put(
        "/users/profilepic/$id",
        data: attachmentData,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint("Error uploading image: $e");
    }
    return null;
  }

  Future<GetCommunityMemberDetail?> updateCommunityMember(data, id) async {
    try {
      var response = await HttpUtils.getInstance().put(
        "/users/communitymember/${id}",
        data: data,
      );
      if (response.statusCode == 200) {
        return GetCommunityMemberDetail.fromJson(response.data as Map<String, dynamic>);
        // return response.data;
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw (e.response!.data);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }

  deleteUser(id) async {
    try {
      var response = await HttpUtils.getInstance().delete("/users/communitymember/${id}");

      if (response.statusCode == 200) {
        return GetCommunityMemberDetail.fromJson(response.data as Map<String, dynamic>);
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
}
