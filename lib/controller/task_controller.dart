import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../service/constant_urls.dart';
import 'package:http/http.dart' as http;

class TaskController {
  final storage = FlutterSecureStorage();
  late String? value;

  addTask(var date, var startTime, var endTime, String status,
      BuildContext context) async {
    value = await storage.read(key: "token");
    log("date" + date);
    log("startTime" + startTime);
    log("endTime" + endTime);
    log("status" + status);
    // log(email);
    // log(password);
    var headers = {
      // HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $value',
      // "Access-Control-Allow-Origin": "*",
      // "Access-Control-Allow-Methods": "POST, OPTIONS"
    };
    String url = "${URLS.baseURL}${URLS.addTask}";
    log("URL:" + url);
// {
//     "userId":"1002",
//     "projectId":"1002",
//     "date":"04/04/2022",
//     "projectName": "Morphfit",
//     "tasks":[
//         {
//             "issueId":"AB02",
//             "taskName": "Task UI",
//             "status": "In Progress",
//             "startTime":"12:30 PM",
//             "endTime": "14:30 PM",
//             "description": "Task UI InCompleted"
//         }

//     ]

// }
    Map<String, dynamic> params = {
      "date": date,
      "projectName": "Qbace",
      "taskName": "forgot password",
      "status": status,
      "startTime": startTime,
      "endTime": endTime,
      "description": "forgot password",
    };
    log(params.toString());

    print(params.toString());
    try {
      var response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(params));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        // if (data["success"] == true) {
        //   print("ADDED");
        //   print(data["data"]["token"]["token"]);
        //   Fluttertoast.showToast(
        //       msg: "Login success",
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.CENTER,
        //       timeInSecForIosWeb: 3,
        //       backgroundColor: Colors.green,
        //       textColor: Colors.white,
        //       fontSize: 16.0);

        //   // await storage.write(
        //   //     key: "token", value: data["data"]["token"]["token"]);
        //   // Future.delayed(const Duration(milliseconds: 500), () {
        //   //   Navigator.of(context)
        //   //       .push(MaterialPageRoute(builder: (context) => TaskPage()));
        //   // });
        // }
      }
      //  else if (response.statusCode == 500) {
      //     print("Internal server error");
      //   } else if (response.statusCode == 404) {
      //     print("Invalid Email or Password");
      //   } else {
      //     print("Retry");
      //   }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> getProjectName() async {
    value = await storage.read(key: "token");

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
        var length = data["data"]["noRecords"];
        for (int i = 0; i < length; i++) {
          projectsName
              .add(data["data"]["records"][i]["projectName"].toString());
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return projectsName;
  }
}
