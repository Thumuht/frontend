import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:thumuht/components/post_list.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/model/session.dart';
import 'package:thumuht/pages/detail.dart';
import 'package:thumuht/router.dart';
import 'package:provider/provider.dart';

const String backendAddress = 'http://10.0.2.2:8899/';
// const String backendAddress = 'http://127.0.0.1:8899/';

Map<String, int> TagMap = {
  "无标签": 0,
  "校园资讯": 1,
  "二手交易": 2,
  "学术研讨": 3,
  "休闲娱乐": 4,
};

Map<int, String> TagMapReverse = {
  0: "无标签",
  1: "校园资讯",
  2: "二手交易",
  3: "学术研讨",
  4: "休闲娱乐",
};

Map<int, Color> TagColor = {
  0: Colors.grey,
  1: Colors.blue,
  2: Colors.green,
  3: Colors.redAccent[400]!,
  4: Colors.yellow,
};

final HttpLink httpLink = HttpLink(
  '${backendAddress}query',
);

void main() async {
  // Hive is a cache for graphql client.
  await initHiveForFlutter();

  runApp(MyApp(
    hstore: HiveStore(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.hstore});

  final Store hstore;
  // This widget is the root of your application.
  // provider: https://www.freecodecamp.org/news/provider-pattern-in-flutter/
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => Session(),
            ),
            ChangeNotifierProvider(
                create: (context) => Order(orderBy: PostOrderBy.createdAt)),
          ],
          child: Consumer<Session>(
            builder: (context, value, child) {
              final myLink = CustomAuthLink(value);
              final Link link = myLink.concat(httpLink);
              return GraphQLProvider(
                  client: ValueNotifier(GraphQLClient(
                      link: link, cache: GraphQLCache(store: hstore))),
                  child: MaterialApp.router(
                    title: 'thumuht',
                    theme: ThemeData(
                      primarySwatch: Colors.lightBlue,
                    ),
                    routerConfig: router(),
                  ));
            },
          ));
}

// https://stackoverflow.com/questions/67195275/how-can-i-add-customised-header-on-http-request-for-authentication-when-using-fl
class CustomAuthLink extends Link {
  CustomAuthLink(this.userSession);
  final Session userSession;

  // https://stackoverflow.com/questions/55397023/whats-the-difference-between-async-and-async-in-dart
  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final String? token = userSession.token_;

    // TIP: do not forget getting new Request instance!
    final Request req = request.updateContextEntry<HttpLinkHeaders>(
      (HttpLinkHeaders? headers) {
        return HttpLinkHeaders(
          headers: <String, String>{
            // put oldest headers
            ...headers?.headers ?? <String, String>{},
            // and add a new headers
            'Token': token ?? '',
          },
        );
      },
    );

    // and "return" new Request with updated headers
    yield* forward!(req);
  }
}
