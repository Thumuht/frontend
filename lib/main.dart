import 'package:flutter/material.dart';
import 'package:thumuht/pages/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'thumuht',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: const HomePage(title_: 'thumuht'),
      );
}
