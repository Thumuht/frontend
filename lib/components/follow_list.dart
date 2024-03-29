// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/main.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/pages/detail.dart';

import '../model/session.dart';

Widget FollowList(BuildContext context) {
  return Column(children: [
    Expanded(child: _buildFollowList(context)),
  ]);
}

VoidCallback? refetchGlobal;
// post list.
Widget _buildFollowList(BuildContext context) {
  return Query(
    options: QueryOptions(
        document: GET_FOLLOW_POST_QUERY_DOCUMENT,
        variables: GetFollowPostArguments(follow: true).toJson()),
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
      final postlists = GetFollowPost$Query.fromJson(result.data!).posts;

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
                    postlists[index]!.user!.id,
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

ListTile _tile(
        int id,
        String title,
        String subtitle,
        int view,
        int like,
        int commentsNum,
        String? position,
        String tag,
        int postUserId,
        BuildContext context) =>
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
                postUserId: postUserId,
              ),
            )).then((value) => refetchGlobal!());
      },
    );
