import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

import '../main.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.userId, required this.refetch});
  final int userId;
  final Refetch refetch;
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
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
          return const Text('Loading...');
        }
        final user = GetUserById$Query.fromJson(result.data!).getUserById;

        return GestureDetector(
          onTap: () async {
            await context.push('/user', extra: {'userId': widget.userId});
            widget.refetch();
          },
          child: Card(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                user.avatar == ''
                    ? Image.asset(
                        'assets/thumuht.jpg',
                        width: 50,
                        height: 50,
                      )
                    : Image.network(
                        '$backendAddress/fs/${user.avatar}',
                        width: 50,
                        height: 50,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Text(user.nickname == '' ? user.loginName : user.nickname!),
              ],
            ),
          )),
        );
      },
    );
  }
}
