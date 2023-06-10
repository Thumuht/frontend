import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../model/gql/graphql_api.graphql.dart';
import '../model/session.dart';
import 'detail.dart';
import 'dart:developer' as developer;

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
    var client = GraphQLProvider.of(context).value;

    Future<List<GetUserPost$Query$User$Post?>?> _future() async {
      var client = GraphQLProvider.of(context).value;
      List<GetUserPost$Query$User$Post?>? resultPost =
          <GetUserPost$Query$User$Post>[];
      developer.log(
          Provider.of<Session>(context, listen: false).userId_!.toString());
      var result = await client.query(QueryOptions(
          document: GET_USER_POST_QUERY_DOCUMENT,
          variables: GetUserPostArguments(
                  id: Provider.of<Session>(context, listen: false).userId_!)
              .toJson()));
      if (result.hasException) {
        return resultPost;
      }
      if (result.isLoading && result.data == null) {
        return resultPost;
      }
      // developer.log(GetUserPost$Query.fromJson(result.data!).toString());
      // developer
      //     .log(GetUserPost$Query.fromJson(result.data!).getUserById.toString());

      resultPost = GetUserPost$Query.fromJson(result.data!).getUserById.post;
      // developer.log(resultPost.toString());
      return resultPost;
    }

    // developer.log(resultPost.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('我的帖子'),
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
                  developer.log(line.toString());
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
              ),
            )).then((value) => refetchGlobal!());
      },
    );
