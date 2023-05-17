import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../model/gql/graphql_api.graphql.dart';
import '../model/session.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? title_;
  String? content_;

  bool _checkParams() => (title_ != null) && (content_ != null);

  //头像，昵称以及登出按钮
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          children: [
            Row(children: [
              Image.asset(
                'assets/thumuht.jpg',
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                children: const [
                  Text("Chlamydomonos"),
                  Text("@chlamydomonos", style: TextStyle(color: Colors.grey)),
                ],
              )
            ]),
            const SizedBox(
              height: 20.0,
            ),
            const Text("X'bao ! Th'wagh! Chlamydomonos xia'd tschilhib'sgn!"),
            const SizedBox(
              height: 40.0,
            ),
            Mutation(
              options: MutationOptions(
                  document: LOGOUT_MUTATION_DOCUMENT,
                  onCompleted: (data) {
                    Provider.of<Session>(context, listen: false).logout();
                  }),
              builder: (runMutation, result) => ElevatedButton(
                onPressed: () {
                  runMutation({});
                },
                child: const Text('Log Out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
