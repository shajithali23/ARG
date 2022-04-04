// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'dart:convert';

Login loginFromMap(String str) => Login.fromMap(json.decode(str));

String loginToMap(Login data) => json.encode(data.toMap());

class Login {
  Login({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        success: json["success"],
        data: Data.fromMap(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
        "message": message,
      };
}

class Data {
  Data({
    required this.results,
    required this.token,
  });

  Results results;
  Token token;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        results: Results.fromMap(json["results"]),
        token: Token.fromMap(json["token"]),
      );

  Map<String, dynamic> toMap() => {
        "results": results.toMap(),
        "token": token.toMap(),
      };
}

class Results {
  Results({
    required this.isActive,
    required this.password,
    required this.lastName,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.email,
    required this.phone,
    required this.firstName,
  });

  String isActive;
  String password;
  String lastName;
  int updatedAt;
  int createdAt;
  String id;
  String email;
  String phone;
  String firstName;

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        isActive: json["isActive"],
        password: json["password"],
        lastName: json["lastName"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        firstName: json["firstName"],
      );

  Map<String, dynamic> toMap() => {
        "isActive": isActive,
        "password": password,
        "lastName": lastName,
        "updatedAt": updatedAt,
        "createdAt": createdAt,
        "id": id,
        "email": email,
        "phone": phone,
        "firstName": firstName,
      };
}

class Token {
  Token({
    required this.token,
  });

  String token;

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
