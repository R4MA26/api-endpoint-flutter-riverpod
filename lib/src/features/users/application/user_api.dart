import 'dart:convert';
import 'dart:developer';

import 'package:connect_api_endpoint/src/features/users/domain/user.dart';
import 'package:connect_api_endpoint/src/utils/api.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<User>> getUser() async {
    final http.Response res = await http.get(Uri.parse(Apis.getUser));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['data'];
      return result.map((value) => User.fromJson(value)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }

  static Future<void> deleteUser({int? id}) async {
    try {
      final http.Response res = await http.delete(
        Uri.parse('${Apis.deleteUser}$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log('res: Api $res');
      if (res.statusCode == 204) {
        log('res 204: Delete Succesfull $res');
      }
    } catch (e) {
      log("${e}gtgtg");
    }
  }
}
