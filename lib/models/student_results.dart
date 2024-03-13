// To parse this JSON data, do
//
//     final studentResults = studentResultsFromJson(jsonString);

import 'dart:convert';

StudentResults studentResultsFromJson(String str) =>
    StudentResults.fromJson(json.decode(str));

String studentResultsToJson(StudentResults data) => json.encode(data.toJson());

class StudentResults {
  String adminAssigned;
  String createdFor;
  String name;
  String document;
  String id;

  StudentResults({
    required this.adminAssigned,
    required this.createdFor,
    required this.name,
    required this.document,
    required this.id,
  });

  factory StudentResults.fromJson(Map<String, dynamic> json) => StudentResults(
        adminAssigned: json["adminAssigned"],
        createdFor: json["createdFor"],
        name: json["name"],
        document: json["document"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "adminAssigned": adminAssigned,
        "createdFor": createdFor,
        "name": name,
        "document": document,
        "_id": id,
      };
}
