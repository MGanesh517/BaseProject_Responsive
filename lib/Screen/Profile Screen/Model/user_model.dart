// To parse this JSON data, do
//
//     final getUserProfileData = getUserProfileDataFromJson(jsonString);

import 'dart:convert';

GetUserProfileData getUserProfileDataFromJson(String str) => GetUserProfileData.fromJson(json.decode(str));

String getUserProfileDataToJson(GetUserProfileData data) => json.encode(data.toJson());

class GetUserProfileData {
    String? id;
    String? username;
    String? fullname;
    String? profilePicture;
    String? email;
    String? phone;
    List<Group>? groups;
    String? firstName;
    String? lastName;
    dynamic otp;
    int? gender;
    String? genderName;
    String? isEmailVerified;
    String? isPhoneVerified;
    bool? isActive;
    int? deviceAccess;
    String? address;
    Community? community;

    GetUserProfileData({
        this.id,
        this.username,
        this.fullname,
        this.profilePicture,
        this.email,
        this.phone,
        this.groups,
        this.firstName,
        this.lastName,
        this.otp,
        this.gender,
        this.genderName,
        this.isEmailVerified,
        this.isPhoneVerified,
        this.isActive,
        this.deviceAccess,
        this.address,
        this.community,
    });

    factory GetUserProfileData.fromJson(Map<String, dynamic> json) => GetUserProfileData(
        id: json["id"],
        username: json["username"],
        fullname: json["fullname"],
        profilePicture: json["profile_picture"],
        email: json["email"],
        phone: json["phone"],
        groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
        firstName: json["first_name"],
        lastName: json["last_name"],
        otp: json["otp"],
        gender: json["gender"],
        genderName: json["gender_name"],
        isEmailVerified: json["is_email_verified"],
        isPhoneVerified: json["is_phone_verified"],
        isActive: json["is_active"],
        deviceAccess: json["device_access"],
        address: json["address"],
        community: json["community"] == null ? null : Community.fromJson(json["community"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullname": fullname,
        "profile_picture": profilePicture,
        "email": email,
        "phone": phone,
        "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toJson())),
        "first_name": firstName,
        "last_name": lastName,
        "otp": otp,
        "gender": gender,
        "gender_name": genderName,
        "is_email_verified": isEmailVerified,
        "is_phone_verified": isPhoneVerified,
        "is_active": isActive,
        "device_access": deviceAccess,
        "address": address,
        "community": community?.toJson(),
    };
}

class Community {
    String? id;
    String? name;

    Community({
        this.id,
        this.name,
    });

    factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Group {
    int? id;
    String? name;

    Group({
        this.id,
        this.name,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
