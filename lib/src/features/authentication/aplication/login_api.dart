import 'dart:convert';
import 'dart:developer';

import 'package:connect_api_endpoint/src/features/authentication/domain/login.dart';
import 'package:connect_api_endpoint/src/utils/api.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Login?> loginUser({String? email, String? password}) async {
    try {
      final http.Response res = await http.post(
        Uri.parse(Apis.loginUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email!,
          'password': password!,
        }),
      );
      if (res.statusCode == 200) {
        // log(res.body);
        var data = jsonDecode(res.body.toString());

        log(data['token']);

        return Login.fromJson(data);
        // Navigator.of(context!).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const UsersScreen(),
        // ));
        // return Login.fromJson(jsonDecode(res.body));
      } else {
        print('Failed');
      }
    } catch (e) {
      log("$e Failed");
    }
    return null;
  }

  // static bool loggedIn() {
  //   return Login().token == null ? false : true;
  // }
}
