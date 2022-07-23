import 'dart:convert';

import 'package:connect_api_endpoint/src/features/users/domain/user.dart';
import 'package:connect_api_endpoint/src/utils/api.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<User>> getUser() async {
    final res = await http.get(Uri.parse(Apis.getUser));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['data'];
      return result.map((value) => User.fromJson(value)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
