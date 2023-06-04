// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/pages/detail.dart';

class Order extends ChangeNotifier {
  Order({required this.orderBy});
  PostOrderBy orderBy;
  Refetch? refetch;
  PostOrderBy get getOrderBy => orderBy;
  changeOrderBy(PostOrderBy _orderBy) {
    orderBy = _orderBy;
    notifyListeners();
  }

  setRefetch(Refetch? _refetch) {
    refetch = _refetch;
    notifyListeners();
  }
}

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

List<String> list = <String>[
  '按时间',
  '按点赞',
  '按评论',
];

FetchMore? fetchMoreGlobal;
Refetch? refetchGlobal;

FetchMoreOptions getOpt(PostOrderBy order) {
  return FetchMoreOptions(
      variables: GetPostListsArguments(offset: 0, orderBy: order).toJson(),
      updateQuery: (previousResultData, fetchMoreResultData) {
        final List<dynamic> repos = [...fetchMoreResultData!['posts']];
        fetchMoreResultData['posts'] = repos;
        return fetchMoreResultData;
      });
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          if (value == '按时间') {
            Provider.of<Order>(context, listen: false)
                .changeOrderBy(PostOrderBy.createdAt);
            fetchMoreGlobal!(getOpt(PostOrderBy.createdAt));
          }
          if (value == '按点赞') {
            Provider.of<Order>(context, listen: false)
                .changeOrderBy(PostOrderBy.like);
            fetchMoreGlobal!(getOpt(PostOrderBy.like));
          }
          if (value == '按评论') {
            Provider.of<Order>(context, listen: false)
                .changeOrderBy(PostOrderBy.commentsNum);
            fetchMoreGlobal!(getOpt(PostOrderBy.commentsNum));
          }
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

Widget trueList(BuildContext context) {
  return Column(children: [
    MyDropdownButton(),
    Expanded(child: _buildList(context)),
  ]);
}

// post list.
Widget _buildList(BuildContext context) {
  Map<String, dynamic> _variable = <String, dynamic>{};
  if (Provider.of<Order>(context, listen: false).getOrderBy ==
      PostOrderBy.createdAt) {
    _variable = GetPostListsArguments(offset: 0, orderBy: PostOrderBy.createdAt)
        .toJson();
  }
  if (Provider.of<Order>(context, listen: false).getOrderBy ==
      PostOrderBy.like) {
    _variable =
        GetPostListsArguments(offset: 0, orderBy: PostOrderBy.like).toJson();
  }
  if (Provider.of<Order>(context, listen: false).getOrderBy ==
      PostOrderBy.commentsNum) {
    _variable =
        GetPostListsArguments(offset: 0, orderBy: PostOrderBy.commentsNum)
            .toJson();
  }

  return Query(
    options: QueryOptions(
        document: GET_POST_LISTS_QUERY_DOCUMENT, variables: _variable),
    builder: (result, {fetchMore, refetch}) {
      if (result.hasException) {
        return Text(result.exception.toString());
      }
      if (result.isLoading && result.data == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      fetchMoreGlobal = fetchMore;
      refetchGlobal = refetch;
      FetchMoreOptions opt = FetchMoreOptions(
        variables: GetPostListsArguments(
                offset: (result.data!['post'] == Null)
                    ? result.data!['posts'].length
                    : 0,
                orderBy: Provider.of<Order>(context, listen: false).getOrderBy)
            .toJson(),
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
}

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
            )).then((value) => refetchGlobal!());
      },
    );
