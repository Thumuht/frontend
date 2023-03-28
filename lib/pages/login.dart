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
  String? loginName_;
  String? password_;

  bool _checkParams() => (loginName_ != null) && (password_ != null);

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
            onChanged: (value) {
              loginName_ = value;
            },
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            onChanged: (value) {
              password_ = value;
            },
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
                  onPressed: () {
                    context.push('/register');
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
                    if (_checkParams()) {
                      runMutation({
                        'loginName': loginName_,
                        'password': password_,
                      });
                    }
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
