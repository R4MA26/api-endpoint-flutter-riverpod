import 'dart:convert';

import 'package:connect_api_endpoint/src/features/users/domain/user.dart';
import 'package:http/http.dart';

class UserApi {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<User>> getUser() async {
    Response res = await get(Uri.parse(endpoint));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['data'];
      return result.map((value) => User.fromJson(value)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}
