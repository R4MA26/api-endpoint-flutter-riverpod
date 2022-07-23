import 'package:connect_api_endpoint/src/features/users/application/user_api.dart';
import 'package:connect_api_endpoint/src/features/users/domain/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiUserProvider = Provider<UserApi>((ref) => UserApi());

final userDataProvider = FutureProvider<List<User>>(
  (ref) async {
    return ref.read(apiUserProvider).getUser();
  },
);
