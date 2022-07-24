import 'package:connect_api_endpoint/src/features/users/application/create_user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_post.dart';

class PostUserRepository extends ChangeNotifier {
  Future<UserPost?> addUser(String name, String job) async {
    notifyListeners();
    return await UserPostApi.postUser(name: name, job: job);
  }
}

final postUserRepositoryProvider = ChangeNotifierProvider<PostUserRepository>(
  (ref) => PostUserRepository(),
);
