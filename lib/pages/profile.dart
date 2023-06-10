import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/main.dart';
import 'package:thumuht/router.dart';

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
        child: Query(
            options: QueryOptions(document: GET_PROFILE_QUERY_DOCUMENT),
            builder: (result, {fetchMore, refetch}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.isLoading || result.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              print(result);
              final me0 = GetProfile$Query.fromJson(result.data!).me;

              return Query(
                options: QueryOptions(document: MY_FOLLOW_QUERY_DOCUMENT),
                builder: (result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }
                  if (result.isLoading || result.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final me = MyFollow$Query.fromJson(result.data!).me;
                  me.follow ??= [];
                  me.block ??= [];
                  return ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24.0),
                    children: [
                      Row(children: [
                        me0.avatar == ''
                            ? Image.asset(
                                'assets/thumuht.jpg',
                                width: 50,
                                height: 50,
                              )
                            : Image.network(
                                '$backendAddress/fs/${me0.avatar}',
                                width: 50,
                                height: 50,
                              ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Column(
                          children: [
                            Text(
                                me0.nickname == ''
                                    ? me0.loginName
                                    : me0.nickname!,
                                style: const TextStyle(fontSize: 20.0)),
                            Text('@${me0.loginName}',
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        )
                      ]),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(me0.about!),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Mutation(
                        options: MutationOptions(
                            document: LOGOUT_MUTATION_DOCUMENT,
                            onCompleted: (data) {
                              Provider.of<Session>(context, listen: false)
                                  .logout();
                            }),
                        builder: (runMutation, result) => ElevatedButton(
                          onPressed: () {
                            runMutation({});
                          },
                          child: const Text('Log Out'),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await context.push('/profile-edit');
                            refetch!();
                          },
                          child: const Text('Edit')),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                context.push('/list', extra: {
                                  'userId': Provider.of<Session>(context,
                                          listen: false)
                                      .userId_,
                                  'isBlacklist': false,
                                  'users':
                                      me.follow!.map((e) => e!.id).toList(),
                                  'refetch': refetch!
                                });
                              },
                              child: const Text('Follow List')),
                          const SizedBox(
                            width: 20.0,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context.push('/list', extra: {
                                  'userId': Provider.of<Session>(context,
                                          listen: false)
                                      .userId_,
                                  'isBlacklist': true,
                                  'users': me.block!.map((e) => e!.id).toList(),
                                  'refetch': refetch!
                                });
                              },
                              child: const Text('Block List')),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.push('/user-posts', extra: {
                              'userId':
                                  Provider.of<Session>(context, listen: false)
                                      .userId_!
                            });
                          },
                          child: const Text('View posts'))
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
