import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/model/session.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          const SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset(
                'assets/thumuht.jpg',
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 16.0),
              const Text('THUMUHT'),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
          const SizedBox(height: 40.0),
          TextField(
            controller: loginNameController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  onPressed: () async {
                    var res = await context.push<List<String>>('/register');
                    loginNameController.text = res![0];
                    passwordController.text = res[1];
                  },
                  child: const Text('Register')),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => {},
              ),
              Mutation(
                options: MutationOptions(
                  document: LOGIN_MUTATION_DOCUMENT,
                  onCompleted: (data) {
                    Provider.of<Session>(context, listen: false)
                        .login(data!['login']);
                  },
                ),
                builder: (runMutation, result) => ElevatedButton(
                  onPressed: () {
                    runMutation({
                      'loginName': loginNameController.text,
                      'password': passwordController.text,
                    });
                    // context.pop();
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
