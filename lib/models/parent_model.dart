// To parse this JSON data, do
//
//     final parentsModel = parentsModelFromJson(jsonString);

import 'dart:convert';

ParentsModel parentsModelFromJson(String str) =>
    ParentsModel.fromJson(json.decode(str));

String parentsModelToJson(ParentsModel data) => json.encode(data.toJson());

class ParentsModel {
  String createdBy;
  String firstname;
  String schoolName;
  String schoolBanner;
  String image;
  String password;
  String email;
  String lastName;
  String phoneNumber;
  int nin;
  String maritalStatus;
  String gender;
  String stateOfOrigin;
  List<String> childrenId;
  String nationality;
  String occupation;
  String address;
  int type;
  String id;
  String token;

  ParentsModel(
      {required this.createdBy,
      required this.firstname,
      required this.schoolName,
      required this.schoolBanner,
      required this.image,
      required this.password,
      required this.email,
      required this.lastName,
      required this.phoneNumber,
      required this.nin,
      required this.maritalStatus,
      required this.gender,
      required this.stateOfOrigin,
      required this.childrenId,
      required this.nationality,
      required this.occupation,
      required this.address,
      required this.type,
      required this.id,
      required this.token});

  factory ParentsModel.fromJson(Map<String, dynamic> json) => ParentsModel(
      createdBy: json["createdBy"],
      firstname: json["firstname"],
      schoolName: json["schoolName"],
      schoolBanner: json["schoolBanner"],
      image: json["image"],
      password: json["password"],
      email: json["email"],
      lastName: json["lastName"],
      phoneNumber: json["phoneNumber"],
      nin: json["nin"],
      maritalStatus: json["maritalStatus"],
      gender: json["gender"],
      stateOfOrigin: json["stateOfOrigin"],
      childrenId: List<String>.from(json["childrenID"].map((x) => x)),
      nationality: json["nationality"],
      occupation: json["occupation"],
      address: json["address"],
      type: json["type"],
      id: json["_id"],
      token: json["token"]);

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "email": email,
        "firstname": firstname,
        "schoolName": schoolName,
        "schoolBanner": schoolBanner,
        "image": image,
        "lastName": lastName,
        "nin": nin,
        "maritalStatus": maritalStatus,
        "gender": gender,
        "stateOfOrigin": stateOfOrigin,
        "childrenID": List<dynamic>.from(childrenId.map((x) => x)),
        "nationality": nationality,
        "occupation": occupation,
        "address": address,
        "type": type,
        "_id": id,
      };
}
