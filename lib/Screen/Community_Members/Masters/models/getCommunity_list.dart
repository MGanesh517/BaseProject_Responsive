// To parse this JSON data, do
//
//     final getCommunityList = getCommunityListFromJson(jsonString);

import 'dart:convert';

GetCommunityList getCommunityListFromJson(String str) => GetCommunityList.fromJson(json.decode(str));

String getCommunityListToJson(GetCommunityList data) => json.encode(data.toJson());

class GetCommunityList {
    int? count;
    List<GetCommunityData>? results;

    GetCommunityList({
        this.count,
        this.results,
    });

    factory GetCommunityList.fromJson(Map<String, dynamic> json) => GetCommunityList(
        count: json["count"],
        results: json["results"] == null ? [] : List<GetCommunityData>.from(json["results"]!.map((x) => GetCommunityData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class GetCommunityData {
    String? id;
    String? code;
    String? name;
    President? president;
    President? vicePresident;
    City? parent;
    City? country;
    City? state;
    City? city;
    String? createdOn;
    String? modifiedOn;

    GetCommunityData({
        this.id,
        this.code,
        this.name,
        this.president,
        this.vicePresident,
        this.parent,
        this.country,
        this.state,
        this.city,
        this.createdOn,
        this.modifiedOn,
    });

    factory GetCommunityData.fromJson(Map<String, dynamic> json) => GetCommunityData(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        president: json["president"] == null ? null : President.fromJson(json["president"]),
        vicePresident: json["vice_president"] == null ? null : President.fromJson(json["vice_president"]),
        parent: json["parent"] == null ? null : City.fromJson(json["parent"]),
        country: json["country"] == null ? null : City.fromJson(json["country"]),
        state: json["state"] == null ? null : City.fromJson(json["state"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        createdOn: json["created_on"],
        modifiedOn: json["modified_on"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "president": president?.toJson(),
        "vice_president": vicePresident?.toJson(),
        "parent": parent?.toJson(),
        "country": country?.toJson(),
        "state": state?.toJson(),
        "city": city?.toJson(),
        "created_on": createdOn,
        "modified_on": modifiedOn,
    };
}

class City {
    String? id;
    String? name;

    City({
        this.id,
        this.name,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class President {
    String? id;
    String? username;
    String? fullname;
    dynamic email;
    String? firstName;
    String? lastName;
    String? phone;

    President({
        this.id,
        this.username,
        this.fullname,
        this.email,
        this.firstName,
        this.lastName,
        this.phone,
    });

    factory President.fromJson(Map<String, dynamic> json) => President(
        id: json["id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullname": fullname,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
    };
}
