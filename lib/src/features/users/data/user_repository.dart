import 'package:connect_api_endpoint/src/features/users/application/user_api.dart';
import 'package:connect_api_endpoint/src/features/users/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteUserRepository extends ChangeNotifier {
  Future<void> delUser(int id) async {
    notifyListeners();
    await UserApi.deleteUser(id: id);
  }
}

final userDeleteDataProvider = ChangeNotifierProvider<DeleteUserRepository>(
  (ref) => DeleteUserRepository(),
);

final apiUserProvider = Provider<UserApi>((ref) => UserApi());

final userDataProvider = FutureProvider<List<User>>(
  (ref) {
    return ref.watch(apiUserProvider).getUser();
  },
);
