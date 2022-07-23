import 'package:connect_api_endpoint/src/features/detail/presentation/detail_screen.dart';
import 'package:connect_api_endpoint/src/features/users/data/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users'),
      ),
      body: data.when(
        data: (data) {
          return Column(
            children: [
              ...data.map(
                (value) => ListView(
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            dataUser: value,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(value.firstName),
                        subtitle: Text(value.lastName),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(value.avatar),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
