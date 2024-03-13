// To parse this JSON data, do
//
//     final schoolDues = schoolDuesFromJson(jsonString);

import 'dart:convert';

List<SchoolDues> schoolDuesFromJson(String str) =>
    List<SchoolDues>.from(json.decode(str).map((x) => SchoolDues.fromJson(x)));

String schoolDuesToJson(List<SchoolDues> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolDues {
  String id;
  String createdBy;
  int amount;
  String feeDescription;
  DateTime deadline;
  List<String> classAssigned;
  // DateTime createdAt;
  // DateTime updatedAt;

  SchoolDues({
    required this.id,
    required this.createdBy,
    required this.amount,
    required this.feeDescription,
    required this.deadline,
    required this.classAssigned,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory SchoolDues.fromJson(Map<String, dynamic> json) => SchoolDues(
        id: json["_id"],
        createdBy: json["createdBy"],
        amount: json["amount"],
        feeDescription: json["feeDescription"],
        deadline: DateTime.parse(json["deadline"]),
        classAssigned: List<String>.from(json["classAssigned"].map((x) => x)),
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdBy": createdBy,
        "amount": amount,
        "feeDescription": feeDescription,
        "deadline": deadline.toIso8601String(),
        "classAssigned": List<dynamic>.from(classAssigned.map((x) => x)),
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
      };
}
