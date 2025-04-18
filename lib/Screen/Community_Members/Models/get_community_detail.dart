// To parse this JSON data, do
//
//     final getCommunityMemberDetail = getCommunityMemberDetailFromJson(jsonString);

import 'dart:convert';

GetCommunityMemberDetail getCommunityMemberDetailFromJson(String str) => GetCommunityMemberDetail.fromJson(json.decode(str));

String getCommunityMemberDetailToJson(GetCommunityMemberDetail data) => json.encode(data.toJson());

class GetCommunityMemberDetail {
    String? id;
    String? code;
    String? username;
    String? fullname;
    String? email;
    String? phone;
    String? firstName;
    String? lastName;
    dynamic otp;
    int? gender;
    String? genderName;
    dynamic dob;
    dynamic age;
    String? adharNo;
    String? address;
    dynamic profilePicture;
    int? maritalStatus;
    String? maritalName;
    String? country;
    String? state;
    String? city;
    Community? community;
    dynamic parentCommunityName;
    String? isEmailVerified;
    String? isPhoneVerified;
    bool? isActive;
    bool? isLate;
    int? deviceAccess;
    List<Relation>? relations;
    dynamic fatherName;
    List<Group>? groups;
    CreatedBy? createdBy;
    dynamic modifiedBy;

    GetCommunityMemberDetail({
        this.id,
        this.code,
        this.username,
        this.fullname,
        this.email,
        this.phone,
        this.firstName,
        this.lastName,
        this.otp,
        this.gender,
        this.genderName,
        this.dob,
        this.age,
        this.adharNo,
        this.address,
        this.profilePicture,
        this.maritalStatus,
        this.maritalName,
        this.country,
        this.state,
        this.city,
        this.community,
        this.parentCommunityName,
        this.isEmailVerified,
        this.isPhoneVerified,
        this.isActive,
        this.isLate,
        this.deviceAccess,
        this.relations,
        this.fatherName,
        this.groups,
        this.createdBy,
        this.modifiedBy,
    });

    factory GetCommunityMemberDetail.fromJson(Map<String, dynamic> json) => GetCommunityMemberDetail(
        id: json["id"],
        code: json["code"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phone: json["phone"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        otp: json["otp"],
        gender: json["gender"],
        genderName: json["gender_name"],
        dob: json["dob"],
        age: json["age"],
        adharNo: json["adhar_no"],
        address: json["address"],
        profilePicture: json["profile_picture"],
        maritalStatus: json["marital_status"],
        maritalName: json["marital_name"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        community: json["community"] == null ? null : Community.fromJson(json["community"]),
        parentCommunityName: json["parent_community_name"],
        isEmailVerified: json["is_email_verified"],
        isPhoneVerified: json["is_phone_verified"],
        isActive: json["is_active"],
        isLate: json["is_late"],
        deviceAccess: json["device_access"],
        relations: json["relations"] == null ? [] : List<Relation>.from(json["relations"]!.map((x) => Relation.fromJson(x))),
        fatherName: json["father_name"],
        groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
        createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
        modifiedBy: json["modified_by"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "username": username,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "first_name": firstName,
        "last_name": lastName,
        "otp": otp,
        "gender": gender,
        "gender_name": genderName,
        "dob": dob,
        "age": age,
        "adhar_no": adharNo,
        "address": address,
        "profile_picture": profilePicture,
        "marital_status": maritalStatus,
        "marital_name": maritalName,
        "country": country,
        "state": state,
        "city": city,
        "community": community?.toJson(),
        "parent_community_name": parentCommunityName,
        "is_email_verified": isEmailVerified,
        "is_phone_verified": isPhoneVerified,
        "is_active": isActive,
        "is_late": isLate,
        "device_access": deviceAccess,
        "relations": relations == null ? [] : List<dynamic>.from(relations!.map((x) => x.toJson())),
        "father_name": fatherName,
        "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toJson())),
        "created_by": createdBy?.toJson(),
        "modified_by": modifiedBy,
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

class CreatedBy {
    String? id;
    String? fullname;

    CreatedBy({
        this.id,
        this.fullname,
    });

    factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
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

class Relation {
    RelationTo? relationTo;
    int? relationtype;
    String? relationtypeName;

    Relation({
        this.relationTo,
        this.relationtype,
        this.relationtypeName,
    });

    factory Relation.fromJson(Map<String, dynamic> json) => Relation(
        relationTo: json["relation_to"] == null ? null : RelationTo.fromJson(json["relation_to"]),
        relationtype: json["relationtype"],
        relationtypeName: json["relationtype_name"],
    );

    Map<String, dynamic> toJson() => {
        "relation_to": relationTo?.toJson(),
        "relationtype": relationtype,
        "relationtype_name": relationtypeName,
    };
}

class RelationTo {
    String? id;
    String? fullname;
    String? firstName;
    String? lastName;
    String? phone;
    dynamic profilePicture;
    dynamic dob;
    int? gender;
    bool? isLate;

    RelationTo({
        this.id,
        this.fullname,
        this.firstName,
        this.lastName,
        this.phone,
        this.profilePicture,
        this.dob,
        this.gender,
        this.isLate,
    });

    factory RelationTo.fromJson(Map<String, dynamic> json) => RelationTo(
        id: json["id"],
        fullname: json["fullname"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        profilePicture: json["profile_picture"],
        dob: json["dob"],
        gender: json["gender"],
        isLate: json["is_late"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "profile_picture": profilePicture,
        "dob": dob,
        "gender": gender,
        "is_late": isLate,
    };
}