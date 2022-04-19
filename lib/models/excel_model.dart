// To parse this JSON data, do
//
//     final jsonToExcel = jsonToExcelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

JsonToExcel jsonToExcelFromMap(String str) =>
    JsonToExcel.fromMap(json.decode(str));

String jsonToExcelToMap(JsonToExcel data) => json.encode(data.toMap());

class JsonToExcel {
  JsonToExcel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic? message;

  factory JsonToExcel.fromMap(Map<String, dynamic> json) => JsonToExcel(
        success: json["success"],
        data: Data.fromMap(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data!.toMap(),
        "message": message,
      };
}

class Data {
  Data({
    required this.items,
    required this.count,
    required this.scannedCount,
  });

  List<Item> items;
  int count;
  int scannedCount;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        items: List<Item>.from(json["Items"].map((x) => Item.fromMap(x))),
        count: json["Count"],
        scannedCount: json["ScannedCount"],
      );

  Map<String, dynamic> toMap() => {
        "Items": List<dynamic>.from(items.map((x) => x.toMap())),
        "Count": count,
        "ScannedCount": scannedCount,
      };
}

class Item {
  Item({
    required this.isActive,
    required this.date,
    required this.task,
    required this.updatedAt,
    required this.userId,
    required this.createdAt,
    required this.isDeleted,
    required this.id,
  });

  String isActive;
  String date;
  List<Task> task;
  int updatedAt;
  String userId;
  int createdAt;
  String isDeleted;
  String id;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        isActive: json["isActive"],
        date: json["date"],
        task: List<Task>.from(json["task"].map((x) => Task.fromMap(x))),
        updatedAt: json["updatedAt"],
        userId: json["userId"],
        createdAt: json["createdAt"],
        isDeleted: json["isDeleted"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "isActive": isActive,
        "date": date,
        "task": List<dynamic>.from(task.map((x) => x.toMap())),
        "updatedAt": updatedAt,
        "userId": userId,
        "createdAt": createdAt,
        "isDeleted": isDeleted,
        "id": id,
      };
}

class Task {
  Task({
    required this.issueId,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.projectName,
    required this.projectId,
    required this.status,
    required this.taskName,
  });

  String issueId;
  String description;
  Time startTime;
  Time endTime;
  String projectName;
  String projectId;
  String status;
  String taskName;

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        issueId: json["issueId"],
        description: json["description"],
        startTime: Time.fromMap(json["startTime"]),
        endTime: Time.fromMap(json["endTime"]),
        projectName: json["projectName"],
        projectId: json["projectId"],
        status: json["status"],
        taskName: json["taskName"] == null ? null : json["taskName"],
      );

  Map<String, dynamic> toMap() => {
        "issueId": issueId,
        "description": description,
        "startTime": startTime.toMap(),
        "endTime": endTime.toMap(),
        "projectName": projectName,
        "projectId": projectId,
        "status": status,
        "taskName": taskName == null ? null : taskName,
      };
}

class Time {
  Time({
    required this.hours,
    required this.minutes,
  });

  int hours;
  int minutes;

  factory Time.fromMap(Map<String, dynamic> json) => Time(
        hours: json["hours"],
        minutes: json["minutes"],
      );

  Map<String, dynamic> toMap() => {
        "hours": hours,
        "minutes": minutes,
      };
}
