import 'package:flutter/material.dart';
import 'package:thumuht/pages/favorite.dart';
import 'package:thumuht/pages/login.dart';
import 'package:thumuht/pages/notification.dart';
import 'package:thumuht/pages/post_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'thumuht',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'thumuht'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const PostListPage();
        break;
      case 1:
        page = const FavoritePage();
        break;
      case 2:
        page = const LoginPage();
        break;
      case 3:
        page = const NotificationPage();
        break;
      default:
        page = const Placeholder();
    }

    return LayoutBuilder(builder: (context, constrains) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            SafeArea(
                child: NavigationRail(
              extended: constrains.maxWidth >= 600,
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.bookmark), label: Text('Favorites')),
                NavigationRailDestination(
                    icon: Icon(Icons.person), label: Text('about me')),
                NavigationRailDestination(
                    icon: Icon(Icons.notifications),
                    label: Text("Notification")),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) => setState(() {
                selectedIndex = value;
              }),
            )),
            Expanded(
              child: page,
            ),
          ],
        ),
      );
    });
  }
}
