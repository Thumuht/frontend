import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

import '../main.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.userId});
  final int userId;
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool _following = false;
  bool _blocking = false;
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
          document: GET_USER_BY_ID_QUERY_DOCUMENT,
          variables: {'id': widget.userId}),
      builder: (result, {fetchMore, refetch}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }
        if (result.isLoading || result.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final user = GetUserById$Query.fromJson(result.data!).getUserById;
        user.follow ??= [];

        if (user.nickname == '') {
          user.nickname = user.loginName;
        }
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

            _following = me.follow!.any((e) => e!.id == widget.userId);
            _blocking = me.block!.any((e) => e!.id == widget.userId);

            return Scaffold(
              appBar: AppBar(
                title: Text('${user.nickname!}\'s Profile'),
                // a button to return to the previous page
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              body: SafeArea(
                  child: ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                children: [
                  Row(children: [
                    user.avatar == ''
                        ? Image.asset(
                            'assets/thumuht.jpg',
                            width: 50,
                            height: 50,
                          )
                        : Image.network(
                            '$backendAddress/fs/${result.data!['me']['avatar'] as String}',
                            width: 50,
                            height: 50,
                          ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        Text(user.nickname!,
                            style: const TextStyle(fontSize: 20.0)),
                        Text('@${user.loginName}',
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    )
                  ]),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(user.about!),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(children: [
                    Mutation(
                      options: MutationOptions(
                        document: _following
                            ? UNFOLLOW_MUTATION_DOCUMENT
                            : FOLLOW_MUTATION_DOCUMENT,
                        onCompleted: (data) {
                          refetch!();
                        },
                      ),
                      builder: (runMutation, result) => ElevatedButton(
                          onPressed: () {
                            runMutation({'userId': widget.userId});
                          },
                          child: _following
                              ? const Text('Unfollow')
                              : const Text('Follow')),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Mutation(
                      options: MutationOptions(
                        document: _blocking
                            ? UNBLOCK_MUTATION_DOCUMENT
                            : BLOCK_MUTATION_DOCUMENT,
                      ),
                      builder: (runMutation, result) => ElevatedButton(
                          onPressed: () async {
                            final result =
                                runMutation({'userId': widget.userId});
                            if ((await result.networkResult)!.hasException) {
                              return;
                            }
                            refetch!();
                          },
                          child: _blocking
                              ? const Text('Unblock')
                              : const Text('Block')),
                    ),
                  ]),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.push('/list', extra: {
                          'userId': widget.userId,
                          'isBlacklist': false,
                          'users': user.follow!.map((e) => e!.id).toList(),
                          'refetch': refetch!
                        });
                      },
                      child: const Text('View follow list')),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.push('/user-posts',
                            extra: {'userId': widget.userId});
                      },
                      child: const Text('View posts'))
                ],
              )),
            );
          },
        );
      },
    );
  }
}
