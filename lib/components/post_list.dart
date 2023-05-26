// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/pages/detail.dart';

Widget trueList(BuildContext context, PostOrderBy orderBy) =>
    _buildList(context, orderBy);

// post list.
Widget _buildList(BuildContext context, PostOrderBy orderBy) => Query(
      options: QueryOptions(
          document: GetPostListsQuery(
                  variables: GetPostListsArguments(offset: 0, orderBy: orderBy))
              .document,
          variables:
              GetPostListsArguments(offset: 0, orderBy: orderBy).toJson()),
      builder: (result, {fetchMore, refetch}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }
        if (result.isLoading && result.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        FetchMoreOptions opt = FetchMoreOptions(
          variables: <String, dynamic>{
            'offset': (result.data!['posts'] == Null)
                ? result.data!['posts'].length
                : 0,
          },
          updateQuery: (previousResultData, fetchMoreResultData) {
            final List<dynamic> repos = [
              ...previousResultData!['posts'],
              ...fetchMoreResultData!['posts']
            ];
            fetchMoreResultData['posts'] = repos;
            return fetchMoreResultData;
          },
        );
        final postlists = GetPostLists$Query.fromJson(result.data!).posts;
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
                      context);
                },
                itemCount: postlists?.length ??
                    0, // this guarantees no null for above two lines.
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (postlists!.length == 10) {
                  fetchMore!(opt);
                }
              },
              child: const Text('Load More'),
            ),
          ],
        );
      },
    );

ListTile _tile(int id, String title, String subtitle, int view, int like,
        int commentsNum, BuildContext context) =>
    ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(subtitle),
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
            // Mutation(
            //     options: MutationOptions(document: LIKE_MUTATION_DOCUMENT),
            //     builder: ((runMutation, result) => TextButton(
            //           onPressed: () {
            //             runMutation({
            //               'userId': id,
            //             });
            //           },
            //           child: const Text('Like'),
            //         ))),
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
              ),
            ));
      },
    );
