import 'package:flutter/material.dart';
import 'package:thumuht/components/post_list.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

import '../components/like_list.dart';
import '../components/mark_list.dart';

class PostListPage extends StatefulWidget {
  PostListPage({super.key, required this.orderBy});
  PostOrderBy orderBy;
  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  @override
  // Widget build(BuildContext context) => trueList(context, widget.orderBy);
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(text: '全部'),
            Tab(text: '已关注'),
            Tab(text: '热门'),
            Tab(text: '已收藏')
          ],
        ),
        body: TabBarView(
          children: [
            trueList(context),
            const Placeholder(),
            LikeList(context),
            markList(context),
          ],
        ),
      ),
    );
  }
}
