import 'dart:developer';

import 'package:connect_api_endpoint/src/features/authentication/aplication/login_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../users/presentasion/users_screen.dart';

class LoginUserRepository extends ChangeNotifier {
  String? _token;
  void setToken(String? v) => v = _token;
  String? getToken() => _token;

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    notifyListeners();

    var data = await LoginApi.loginUser(email: email, password: password);

    if (data != null) {
      setToken(data.token);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return UsersScreen(token: data.token);
        },
      ));
    } else {
      log("Failed");
    }
  }
}

final loginUserRepositoryProvider = ChangeNotifierProvider<LoginUserRepository>(
  (ref) => LoginUserRepository(),
);
