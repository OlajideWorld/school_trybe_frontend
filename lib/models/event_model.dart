// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

List<EventsModel> eventsModelFromJson(String str) => List<EventsModel>.from(
    json.decode(str).map((x) => EventsModel.fromJson(x)));

String eventsModelToJson(List<EventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsModel {
  final String id;
  final String createdBy;
  final String image;
  final String title;
  final String venue;
  final DateTime startTime;
  final DateTime stopTime;
  final DateTime date;
  final String description;

  EventsModel({
    required this.id,
    required this.createdBy,
    required this.image,
    required this.title,
    required this.venue,
    required this.startTime,
    required this.stopTime,
    required this.date,
    required this.description,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: json["_id"],
        createdBy: json["createdBy"],
        image: json["image"],
        title: json["title"],
        venue: json["venue"],
        startTime: DateTime.parse(json["startTime"]),
        stopTime: DateTime.parse(json["stopTime"]),
        date: DateTime.parse(json["date"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdBy": createdBy,
        "image": image,
        "title": title,
        "venue": venue,
        "startTime": startTime.toIso8601String(),
        "stopTime": stopTime.toIso8601String(),
        "date": date.toIso8601String(),
        "description": description,
      };
}
