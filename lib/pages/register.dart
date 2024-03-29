import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:thumuht/model/gql/graphql_api.graphql.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                'Register',
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
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            onChanged: (value) {
              // check if the input is the same as password_, if not show a error message which will disapprear after 1 seconds. Please do not use scaffoldMessenger
              if (value != password_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('The password is not the same'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).clearSnackBars();
              }
            },
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Please confirm your password',
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 12.0,
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => {context.pop()},
              ),
              Mutation(
                options: MutationOptions(document: REGISTER_MUTATION_DOCUMENT),
                builder: (runMutation, result) => ElevatedButton(
                  onPressed: () {
                    if (_checkParams()) {
                      runMutation({
                        'loginName': loginName_,
                        'password': password_,
                      });
                      List<String> args = [loginName_!, password_!];
                      context.pop(args);
                    }
                  },
                  child: const Text('Register'),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
