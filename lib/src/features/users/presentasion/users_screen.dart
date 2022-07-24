import 'dart:developer';

import 'package:connect_api_endpoint/src/common_widgets/image_circular_custom.dart';
import 'package:connect_api_endpoint/src/features/users/data/user_repository.dart';
import 'package:connect_api_endpoint/src/features/users/presentasion/create_users/create_user_screen.dart';
import 'package:connect_api_endpoint/src/features/users/presentasion/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataProvider);
    final deleteUserProvider = ref.read(userDeleteDataProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateUsersScreen(),
                ),
              ),
              icon: const Icon(Icons.add),
            ),
          ),
        ],
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
                      child: Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.red,
                        ),
                        onDismissed: (direction) {
                          deleteUserProvider.delUser(value.id);
                          log(value.id.toString());

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Name: ${value.firstName},id: ${value.id} Deleted'),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(value.firstName),
                          subtitle: Text(value.lastName),
                          trailing: ImageCircularCustom(image: value.avatar),
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
