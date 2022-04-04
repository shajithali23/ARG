import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../screens/task_page.dart';
import '../service/constant_urls.dart';

class SignInController {
  final storage = FlutterSecureStorage();
  login(String email, String password, BuildContext context) async {
    log(email);
    log(password);

    String url = "${URLS.baseURL}${URLS.login}";
    log("URL:" + url);

    Map<String, dynamic> params = {
      "email": email,
      "password": password,
    };
    log(params.toString());
    try {
      var response = await http.post(Uri.parse(url), body: jsonEncode(params));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["success"] == true) {
          print(data["data"]["token"]["token"]);
          Fluttertoast.showToast(
              msg: "Login success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

          await storage.write(
              key: "token", value: data["data"]["token"]["token"]);
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => TaskPage()));
          });
        }
      } else if (response.statusCode == 500) {
        print("Internal server error");
      } else if (response.statusCode == 404) {
        print("Invalid Email or Password");
      } else {
        print("Retry");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
