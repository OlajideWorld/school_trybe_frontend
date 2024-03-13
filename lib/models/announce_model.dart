// To parse this JSON data, do
//
//     final announceModel = announceModelFromJson(jsonString);

import 'dart:convert';

List<AnnounceModel> announceModelFromJson(String str) =>
    List<AnnounceModel>.from(
        json.decode(str).map((x) => AnnounceModel.fromJson(x)));

String announceModelToJson(List<AnnounceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnnounceModel {
  String id;
  String createdBy;
  String image;
  String title;
  String details;
  // DateTime createdAt;
  // DateTime updatedAt;
  // int v;

  AnnounceModel({
    required this.id,
    required this.createdBy,
    required this.image,
    required this.title,
    required this.details,
  });

  factory AnnounceModel.fromJson(Map<String, dynamic> json) => AnnounceModel(
        id: json["_id"],
        createdBy: json["createdBy"],
        image: json["image"],
        title: json["title"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdBy": createdBy,
        "image": image,
        "title": title,
        "details": details,
      };
}
