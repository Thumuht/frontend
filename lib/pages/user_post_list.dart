import 'package:flutter/material.dart';

class UserPostList extends StatefulWidget {
  const UserPostList({super.key, required this.userId});
  final int userId;
  @override
  _UserPostListState createState() => _UserPostListState();
}

class _UserPostListState extends State<UserPostList> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('UserPostList is not implemented');
    //TODO: 完成它
  }
}
