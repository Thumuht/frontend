import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              const Text('THUMUHT')
            ],
          ),
          const SizedBox(height: 60.0),
          const TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => {},
              ),
              ElevatedButton(onPressed: () => {}, child: const Text("Login"))
            ],
          )
        ],
      )),
    );
  }
}
