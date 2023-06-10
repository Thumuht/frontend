// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/main.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/pages/detail.dart';
import 'package:thumuht/pages/new_post.dart';

import '../model/session.dart';

FetchMore? fetchMoreGlobal;
Refetch? refetchGlobal;

FetchMoreOptions getOpt(String tag) {
  return FetchMoreOptions(
      variables: GetTypePostArguments(tags: tag).toJson(),
      updateQuery: (previousResultData, fetchMoreResultData) {
        final List<dynamic> repos = [...fetchMoreResultData!['posts']];
        fetchMoreResultData['posts'] = repos;
        return fetchMoreResultData;
      });
}

List<String> tags = ["校园资讯", "二手交易", "学术研讨", "休闲娱乐"];

class selectTypeTag extends StatefulWidget {
  const selectTypeTag({Key? key}) : super(key: key);

  @override
  State<selectTypeTag> createState() => _selectTypeState();
}

class _selectTypeState extends State<selectTypeTag> {
  String _value = tags.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _value,
      elevation: 16,
      onChanged: (String? value) {
        setState(() {
          if (value == "校园资讯") {
            _value = "校园资讯";
            fetchMoreGlobal == null ? null : fetchMoreGlobal!(getOpt("校园资讯"));
          } else if (value == "二手交易") {
            _value = "二手交易";
            fetchMoreGlobal == null ? null : fetchMoreGlobal!(getOpt("二手交易"));
          } else if (value == "学术研讨") {
            _value = "学术研讨";
            fetchMoreGlobal == null ? null : fetchMoreGlobal!(getOpt("学术研讨"));
          } else if (value == "休闲娱乐") {
            _value = "休闲娱乐";
            fetchMoreGlobal == null ? null : fetchMoreGlobal!(getOpt("休闲娱乐"));
          }
        });
      },
      items: tags.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

Widget TypeList(BuildContext context) {
  return Column(children: [
    const selectTypeTag(),
    Expanded(child: _buildTypeList(context)),
  ]);
}

// post list.
Widget _buildTypeList(BuildContext context) {
  return Query(
    options: QueryOptions(
        document: GET_TYPE_POST_QUERY_DOCUMENT,
        variables: GetTypePostArguments(tags: "校园资讯").toJson()),
    builder: (result, {fetchMore, refetch}) {
      if (result.hasException) {
        return Text(result.exception.toString());
      }
      if (result.isLoading && result.data == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      refetchGlobal = refetch;
      fetchMoreGlobal = fetchMore;
      final postlists = GetTypePost$Query.fromJson(result.data!).posts;

      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _tile(
                    postlists![index]!.id,
                    postlists[index]!.title!,
                    postlists[index]!.content!,
                    postlists[index]!.view!,
                    postlists[index]!.like!,
                    postlists[index]!.commentsNum!,
                    postlists[index]!.position,
                    postlists[index]!.tag!,
                    context);
              },
              itemCount: postlists?.length ??
                  0, // this guarantees no null for above two lines.
            ),
          ),
        ],
      );
    },
  );
}

ListTile _tile(int id, String title, String subtitle, int view, int like,
        int commentsNum, String? position, String tag, BuildContext context) =>
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
            label: Text(tag),
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
              'View',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(width: 2),
            Text(
              view.toString(),
              style: TextStyle(fontSize: 10),
            ),
          ]),
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
