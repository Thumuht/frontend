import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:thumuht/components/post_list.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

import '../components/mark_list.dart';
import '../main.dart';
import 'detail.dart';
import 'dart:developer' as developer;

class searchResultPage extends StatefulWidget {
  searchResultPage({super.key, required this.keyWord});
  String keyWord;
  @override
  State<searchResultPage> createState() => _searchResultPageState();
}

class _searchResultPageState extends State<searchResultPage> {
  @override
  Widget build(BuildContext context) {
    var client = GraphQLProvider.of(context).value;
    Widget show = Container();
    var _mFuture;

    Future<List<GlobalSearch$Query$Post?>?> _future() async {
      var client = GraphQLProvider.of(context).value;
      List<GlobalSearch$Query$Post?>? resultPost = <GlobalSearch$Query$Post>[];
      var result = await client.query(QueryOptions(
          document: GLOBAL_SEARCH_QUERY_DOCUMENT,
          variables: GlobalSearchArguments(keyWord: widget.keyWord).toJson()));
      if (result.hasException) {
        return resultPost;
      }
      if (result.isLoading && result.data == null) {
        return resultPost;
      }
      resultPost = GlobalSearch$Query.fromJson(result.data!).globalSearch;
      
      return resultPost;
    }

    // developer.log(resultPost.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索结果'),
      ),
      body: FutureBuilder(
        future: _future(),
        builder: (context, snapshot) {
          // developer.log(resultPost.toString());
          Widget widget = Container();
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              widget = const Text("出错了");
            } else {
              // var resultPost = GlobalSearch$Query.fromJson(snapshot.data!).posts;
              // developer.log(resultPost.toString());
              widget = ListView.builder(
                itemBuilder: (context, index) {
                  var line = snapshot.data![index]!;
                  return _tile(
                      line.id,
                      line.title!,
                      line.content!,
                      line.view!,
                      line.like!,
                      line.commentsNum!,
                      line.position,
                      line.tag,
                      context);
                },
                itemCount: snapshot.data?.length ??
                    0, // this guarantees no null for above two lines.
              );
            }
          }
          return widget;
        },
      ),
    );
  }
}

ListTile _tile(int id, String title, String subtitle, int view, int like,
        int commentsNum, String? position, String? tag, BuildContext context) =>
    ListTile(
      title: Row(children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 10),
        if (tag != "none")
          RawChip(
            label: Text(tag!),
            backgroundColor: TagColor[tag],
          )
      ]),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(!subtitle.contains('![]')
            ? subtitle
            : subtitle.substring(0, subtitle.indexOf('![]'))),
        const SizedBox(
          height: 2,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Like',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(width: 2),
            Text(
              like.toString(),
              style: TextStyle(fontSize: 10),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'comments',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(width: 2),
            Text(
              commentsNum.toString(),
              style: TextStyle(fontSize: 10),
            )
          ])
        ])
      ]),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                id: id,
                title: title,
                content: subtitle,
                like: like,
                commentsNum: commentsNum,
                position: position!,
                postUserId: 0, // FIXME
              ),
            ));
      },
    );


// class _PostListPageState extends State<PostListPage> {
//   @override
//   // Widget build(BuildContext context) => trueList(context, widget.orderBy);
//   Widget build(BuildContext context) {

//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: const TabBar(
//           tabs: [
//             Tab(text: '全部'),
//             Tab(text: '已关注'),
//             Tab(text: '热门'),
//             Tab(text: '已收藏')
//           ],
//         ),
//         body: TabBarView(
//           children: [
//             trueList(context),
//             const Placeholder(),
//             const Placeholder(),
//             markList(context),
//           ],
//         ),
//       ),
//     );
//   }
// }
