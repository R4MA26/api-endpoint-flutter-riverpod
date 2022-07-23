import 'dart:developer';

import 'package:connect_api_endpoint/src/features/create_users/data/user_post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_post.dart';

class CreateUsersScreen extends ConsumerWidget {
  const CreateUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerJob = TextEditingController();
    UserPost? data;

    final postUserProvider = ref.read(postUserRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              TextField(
                controller: controllerName,
                obscureText: false,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Masukkan Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerJob,
                obscureText: false,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Masukkan Job",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  data = await postUserProvider.addUser(
                      controllerName.text, controllerJob.text);
                  log(data?.name.toString() ?? "Failed");
                  log(data?.job.toString() ?? "Failed");
                },
                child: const Text('Submit'),
              ),
              Text(data?.name.toString() ?? "Empty")
            ],
          ),
        ),
      ),
    );
  }
}
