import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:report_generator/controller/sign_in_controller.dart';

import '../service/constant_urls.dart';
import 'package:http/http.dart' as http;

class TaskController {
  late String? value;

  addTask(
      {required String date,
      required String startTime,
      required String projectName,
      required String endTime,
      required String token,
      required String status,
      required String issueId,
      required String taskName,
      required String desc,
      required BuildContext context}) async {
    print("HAI");
    log(date);
    // print("EXE");
    // print("EXE1");
    // // SignInController controller = SignInController();
    // print("TOKEN" + token.toString());

    // log("date" + date);
    // log("startTime" + startTime);
    // log("endTime" + endTime);
    // log("status" + status);
    var headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    String url = "${URLS.baseURL}${URLS.addTask}";
    log("URL:" + url);
    Map<String, dynamic> params = {
      "date": date,
      "projectName": projectName,
      "userId": "1002",
      "projectId": "1002",
      "issueId": issueId,
      "taskName": taskName,
      "status": status,
      "startTime": startTime,
      "endTime": endTime,
      "description": desc,
    };
    log(params.toString());

    print(params.toString());
    try {
      var response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(params));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data["success"] == true) {
          print("Task Added");
        } else {
          print("No Task Added");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getProjectName() async {
    var headers = {HttpHeaders.authorizationHeader: 'Bearer $value'};
    List projectsName = [];
    try {
      var response = await http.get(
        Uri.parse(
            "https://xbaxixxkv0.execute-api.ap-southeast-1.amazonaws.com/dev/arg_project"),
        headers: headers,
      );
      print("RES--->" + response.statusCode.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
        // var length = data["data"]["noRecords"];
        // for (int i = 0; i < length; i++) {
        //   projectsName
        //       .add(data["data"]["records"][i]["projectName"].toString());
        // }
      }
    } catch (e) {
      print(e.toString());
    }
    return projectsName;
  }
}
