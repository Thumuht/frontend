import 'package:flutter/material.dart';
import 'package:thumuht/components/post_list.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

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
    //   return TabBarView(
    //     children: [
    //       trueList(context, PostOrderBy.createdAt),
    //       trueList(context, PostOrderBy.like),
    //       trueList(context, PostOrderBy.commentsNum),
    //     ],
    //   );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(text: '最新'),
            Tab(text: '最热'),
            Tab(text: '评论'),
          ],
        ),
        body: TabBarView(
          children: [
            trueList(context, PostOrderBy.createdAt),
            trueList(context, PostOrderBy.like),
            trueList(context, PostOrderBy.commentsNum),
          ],
        ),
      ),
    );
  }
}
