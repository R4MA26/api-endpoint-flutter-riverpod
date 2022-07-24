import 'package:connect_api_endpoint/src/features/authentication/data/login_repository.dart';
import 'package:connect_api_endpoint/src/features/authentication/domain/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail =
      TextEditingController(text: 'eve.holt@reqres.in');
  final TextEditingController _controllerPassword =
      TextEditingController(text: 'cityslicka');
  // late Login _data;

  @override
  Widget build(BuildContext context) {
    Login? data;
    final loginProvider = ref.read(loginUserRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _controllerEmail,
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
                    hintText: "Masukkan Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _controllerPassword,
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
                    hintText: "Masukkan Paswword",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await loginProvider.loginUser(_controllerEmail.text,
                            _controllerPassword.text, context);
                        // ignore: use_build_context_synchronously

                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _login() {
  //   // var res = await LoginApi.loginUser();
  //   // var data = jsonDecode(res.body.toString());

  //   // final login = ref.read(loginUserRepositoryProvider);
  //   // final loggedIn = login.currentUser == null ? false : true;
  //   // if (data['token']) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => const UsersScreen()),
  //   );
  //   // } else {
  //   //   print('Failed Route');
  //   // }
  // }
}
