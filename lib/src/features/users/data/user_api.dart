import 'dart:convert';

import 'package:connect_api_endpoint/src/features/users/domain/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class UserApi {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<User>> getUser() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiProvider = Provider<UserApi>((ref) => UserApi());

final userDataProvider = FutureProvider<List<User>>((ref) async {
  return ref.read(apiProvider).getUser();
});
