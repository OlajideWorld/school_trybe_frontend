// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  String createdBy;
  String image;
  String firstname;
  String lastname;
  String guardianName;
  String gender;
  String phoneNumber;
  DateTime dateOfBirth;
  String bloodGroup;
  String address;
  String classAssigned;
  String classSection;
  String studentType;
  String id;
  // DateTime createdAt;
  // DateTime updatedAt;
  // int v;

  StudentModel({
    required this.createdBy,
    required this.image,
    required this.firstname,
    required this.lastname,
    required this.guardianName,
    required this.gender,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.bloodGroup,
    required this.address,
    required this.classAssigned,
    required this.classSection,
    required this.studentType,
    required this.id,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.v,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        createdBy: json["createdBy"],
        image: json["image"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        guardianName: json["guardianName"],
        gender: json["gender"],
        phoneNumber: json["phoneNumber"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        bloodGroup: json["bloodGroup"],
        address: json["address"],
        classAssigned: json["classAssigned"],
        classSection: json["classSection"],
        studentType: json["studentType"],
        id: json["_id"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "image": image,
        "firstname": firstname,
        "lastname": lastname,
        "guardianName": guardianName,
        "gender": gender,
        "phoneNumber": phoneNumber,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "bloodGroup": bloodGroup,
        "address": address,
        "classAssigned": classAssigned,
        "classSection": classSection,
        "studentType": studentType,
        "_id": id,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        // "__v": v,
      };
}
