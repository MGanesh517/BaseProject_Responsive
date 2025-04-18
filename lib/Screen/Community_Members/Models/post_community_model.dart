// To parse this JSON data, do
//
//     final postCommunityData = postCommunityDataFromJson(jsonString);

import 'dart:convert';

PostCommunityData postCommunityDataFromJson(String str) => PostCommunityData.fromJson(json.decode(str));

String postCommunityDataToJson(PostCommunityData data) => json.encode(data.toJson());

class PostCommunityData {
    String? username;
    String? email;
    String? phone;
    String? password;
    String? firstName;
    String? lastName;
    int? gender;
    int? relation;
    DateTime? dob;
    String? adharNo;
    String? address;
    int? maritalStatus;
    Community? community;
    String? communityId;
    bool? isActive;
    bool? isLate;
    int? deviceAccess;
    String? fatherId;
    String? motherId;
    String? spouseId;
    List<int>? groupIds;

    PostCommunityData({
        this.username,
        this.email,
        this.phone,
        this.password,
        this.firstName,
        this.lastName,
        this.gender,
        this.relation,
        this.dob,
        this.adharNo,
        this.address,
        this.maritalStatus,
        this.community,
        this.communityId,
        this.isActive,
        this.isLate,
        this.deviceAccess,
        this.fatherId,
        this.motherId,
        this.spouseId,
        this.groupIds,
    });

    factory PostCommunityData.fromJson(Map<String, dynamic> json) => PostCommunityData(
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        relation: json["relation"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        adharNo: json["adhar_no"],
        address: json["address"],
        maritalStatus: json["marital_status"],
        community: json["community"] == null ? null : Community.fromJson(json["community"]),
        communityId: json["community_id"],
        isActive: json["is_active"],
        isLate: json["is_late"],
        deviceAccess: json["device_access"],
        fatherId: json["father_id"],
        motherId: json["mother_id"],
        spouseId: json["spouse_id"],
        groupIds: json["group_ids"] == null ? [] : List<int>.from(json["group_ids"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "relation": relation,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "adhar_no": adharNo,
        "address": address,
        "marital_status": maritalStatus,
        "community": community?.toJson(),
        "community_id": communityId,
        "is_active": isActive,
        "device_access": deviceAccess,
        "father_id": fatherId,
        "mother_id": motherId,
        "spouse_id": spouseId,
        "group_ids": groupIds == null ? [] : List<dynamic>.from(groupIds!.map((x) => x)),
    };
}

class Community {
    String? name;

    Community({
        this.name,
    });

    factory Community.fromJson(Map<String, dynamic> json) => Community(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
