import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../components/user_card.dart';

class UserList extends StatefulWidget {
  const UserList(
      {super.key,
      required this.userId,
      required this.isBlacklist,
      required this.users,
      required this.refetch});
  final int userId;
  final bool isBlacklist;
  final List<int> users;
  final Refetch refetch;
  @override
  createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isBlacklist ? 'Blacklist' : 'Follow List'),
      ),
      body: SafeArea(
          child: ListView(
              padding: const EdgeInsets.all(10),
              controller: _scrollController,
              children: widget.users
                  .map((e) => UserCard(
                        userId: e,
                        refetch: widget.refetch,
                      ))
                  .toList())),
    );
  }
}
