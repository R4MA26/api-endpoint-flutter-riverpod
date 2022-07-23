import 'package:connect_api_endpoint/src/features/users/domain/user.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.dataUser}) : super(key: key);

  final User dataUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataUser.firstName),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(dataUser.avatar),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('${dataUser.firstName} ${dataUser.lastName}'),
            const SizedBox(
              height: 5,
            ),
            Text(dataUser.email),
          ],
        ),
      ),
    );
  }
}
