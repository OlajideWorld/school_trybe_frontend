// To parse this JSON data, do
//
//     final schoolModel = schoolModelFromJson(jsonString);

import 'dart:convert';

SchoolModel schoolModelFromJson(String str) =>
    SchoolModel.fromJson(json.decode(str));

String schoolModelToJson(SchoolModel data) => json.encode(data.toJson());

class SchoolModel {
  String createdBy;
  String image;
  String schoolName;
  String email;
  String phoneNumber;
  String address;
  String country;
  String totalStudentRange;
  List<String> schoolType;
  String id;

  SchoolModel({
    required this.createdBy,
    required this.image,
    required this.schoolName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.country,
    required this.totalStudentRange,
    required this.schoolType,
    required this.id,
  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        createdBy: json["createdBy"],
        image: json["image"],
        schoolName: json["schoolName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        country: json["country"],
        totalStudentRange: json["totalStudentRange"],
        schoolType: List<String>.from(json["schoolType"].map((x) => x)),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "image": image,
        "schoolName": schoolName,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "country": country,
        "totalStudentRange": totalStudentRange,
        "schoolType": List<dynamic>.from(schoolType.map((x) => x)),
        "_id": id,
      };
}

