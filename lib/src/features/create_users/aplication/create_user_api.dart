import 'dart:convert';
import 'dart:developer';

import 'package:connect_api_endpoint/src/features/create_users/domain/user_post.dart';
import 'package:connect_api_endpoint/src/utils/api.dart';
import 'package:http/http.dart' as http;

class UserPostApi {
  static Future<UserPost?> postUser({String? name, String? job}) async {
    try {
      final res = await http.post(
        Uri.parse(Apis.postUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name!,
          'job': job!,
        }),
      );
      if (res.statusCode == 201) {
        log(res.body);
        return UserPost.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
