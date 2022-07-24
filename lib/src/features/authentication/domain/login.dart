// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.token,
    this.email,
    this.password,
  });
  final String? token;
  final String? email;
  final String? password;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
