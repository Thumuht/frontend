import 'package:flutter/material.dart';
import 'package:thumuht/pages/homepage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // Hive is a cache for graphql client.
  await initHiveForFlutter();

  // GraphQL Server address
  final HttpLink httpLink = HttpLink(
    'http://localhost:8899/query',
  );

  // Graphql client
  //
  // Value Notifier is a [ChangeNotifier] that holds a single value.
  // When [value] is replaced with something that is not equal to the old value
  // as evaluated by the equality operator ==, this class notifies its listeners.
  ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())));

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});

  final ValueNotifier<GraphQLClient> client;

  // This widget is the root of your application.
  // provider: https://www.freecodecamp.org/news/provider-pattern-in-flutter/
  @override
  Widget build(BuildContext context) => GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'thumuht',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: const HomePage(title_: 'thumuht'),
      ));
}
