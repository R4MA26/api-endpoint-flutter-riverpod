import 'dart:developer';

import 'package:connect_api_endpoint/src/features/users/data/user_post_repository.dart';
import 'package:connect_api_endpoint/src/features/users/domain/user_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateUsersScreen extends ConsumerStatefulWidget {
  const CreateUsersScreen({super.key});

  @override
  CreateUsersScreenState createState() => CreateUsersScreenState();
}

class CreateUsersScreenState extends ConsumerState<CreateUsersScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerJob = TextEditingController();
  UserPost? _data;

  @override
  Widget build(BuildContext context) {
    final postUserProvider = ref.read(postUserRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _controllerName,
                  obscureText: false,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    if (text.length < 4) {
                      return 'Too short';
                    }
                    return null;
                  },
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
                TextFormField(
                  controller: _controllerJob,
                  obscureText: false,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    return null;
                  },
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _data = await postUserProvider.addUser(_controllerName.text, _controllerJob.text);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Created Succes'),
                              content: SizedBox(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: ${_data!.name}'),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text('Job: ${_data!.job}'),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        _controllerJob.clear();
                        _controllerName.clear();
                      }
                      log(_data?.name.toString() ?? "Failed");
                      log(_data?.job.toString() ?? "Failed");
                    },
                    child: const Text('Submit'),
                  ),
                ),
                // Text(data?.name.toString() ?? "Empty")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
