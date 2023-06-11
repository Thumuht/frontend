// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/main.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/model/session.dart';
import 'package:thumuht/pages/detail.dart';
import 'package:thumuht/pages/search_result.dart';

class OrderBy extends ChangeNotifier {
  OrderBy({required this.orderBy});
  PostOrderBy orderBy;
  Order order = Order.asc;
  Refetch? refetch;
  PostOrderBy get getOrderBy => orderBy;
  Order get getOrder => order;
  changeOrderBy(PostOrderBy _orderBy) {
    orderBy = _orderBy;
    notifyListeners();
  }

  changeOrder(Order _order) {
    order = _order;
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

FetchMoreOptions getOpt(PostOrderBy orderBy, Order order) {
  return FetchMoreOptions(
      variables:
          GetPostListsArguments(offset: 0, orderBy: orderBy, order: order)
              .toJson(),
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
            Provider.of<OrderBy>(context, listen: false)
                .changeOrderBy(PostOrderBy.createdAt);
            Provider.of<OrderBy>(context, listen: false)
                .changeOrder(Order.desc);
            fetchMoreGlobal!(getOpt(PostOrderBy.createdAt, Order.desc));
          }
          if (value == '按点赞') {
            Provider.of<OrderBy>(context, listen: false)
                .changeOrderBy(PostOrderBy.like);
            Provider.of<OrderBy>(context, listen: false).changeOrder(Order.asc);
            fetchMoreGlobal!(getOpt(PostOrderBy.like, Order.asc));
          }
          if (value == '按评论') {
            Provider.of<OrderBy>(context, listen: false)
                .changeOrderBy(PostOrderBy.commentsNum);
            Provider.of<OrderBy>(context, listen: false)
                .changeOrder(Order.desc);
            fetchMoreGlobal!(getOpt(PostOrderBy.commentsNum, Order.desc));
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

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => searchResultPage(
                    keyWord: _controller.text,
                  ),
                ));
          },
          icon: Icon(Icons.search)),
      Expanded(
        child: SizedBox(
            height: 40.0,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: '请输入搜索关键词',
                border: OutlineInputBorder(),
              ),
            )),
      ),
      MyDropdownButton(),
    ]);
  }
}

Widget trueList(BuildContext context) {
  return Column(children: [
    const SearchWidget(),
    Expanded(child: _buildList(context)),
  ]);
}

// post list.
Widget _buildList(BuildContext context) {
  Map<String, dynamic> _variable = <String, dynamic>{};
  if (Provider.of<OrderBy>(context, listen: false).getOrderBy ==
      PostOrderBy.createdAt) {
    _variable = GetPostListsArguments(
            offset: 0, orderBy: PostOrderBy.createdAt, order: Order.asc)
        .toJson();
  }
  if (Provider.of<OrderBy>(context, listen: false).getOrderBy ==
      PostOrderBy.like) {
    _variable = GetPostListsArguments(
            offset: 0, orderBy: PostOrderBy.like, order: Order.asc)
        .toJson();
  }
  if (Provider.of<OrderBy>(context, listen: false).getOrderBy ==
      PostOrderBy.commentsNum) {
    _variable = GetPostListsArguments(
            offset: 0, orderBy: PostOrderBy.commentsNum, order: Order.desc)
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
                offset: (result.data?['post'] != null)
                    ? result.data!['posts'].length
                    : 0,
                orderBy:
                    Provider.of<OrderBy>(context, listen: false).getOrderBy,
                order: Provider.of<OrderBy>(context, listen: false).getOrder)
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
                    postlists[index]!.position,
                    postlists[index]!.tag,
                    postlists[index]!.user?.id ?? 0,
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

ListTile _tile(
        int id,
        String title,
        String subtitle,
        int view,
        int like,
        int commentsNum,
        String? position,
        String? tag,
        int postUserId,
        BuildContext context) =>
    ListTile(
      leading: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.push('/user', extra: {'userId': postUserId});
            },
            child: Query(
              options: QueryOptions(
                  document: GET_USER_BY_ID_QUERY_DOCUMENT,
                  variables: {
                    'id': postUserId,
                  }),
              builder: (result, {fetchMore, refetch}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }
                if (result.isLoading || result.data == null) {
                  return const Text('Loading...');
                }
                final user =
                    GetUserById$Query.fromJson(result.data!).getUserById;
                return user.avatar == ''
                    ? Image.asset(
                        'assets/thumuht.jpg',
                        width: 25,
                        height: 25,
                      )
                    : Image.network(
                        '${backendAddress}fs/${user.avatar}',
                        width: 25,
                        height: 25,
                      );
              },
            ),
          ),
          Provider.of<Session>(context, listen: false).login_
              ? Query(
                  options: QueryOptions(document: MY_FOLLOW_QUERY_DOCUMENT),
                  builder: (result, {fetchMore, refetch}) {
                    if (result.hasException) {
                      return Text(result.exception.toString());
                    }
                    if (result.isLoading || result.data == null) {
                      return const Text('Loading...');
                    }
                    final me = MyFollow$Query.fromJson(result.data!).me;
                    me.follow ??= [];
                    if (me.follow!.any((e) => e!.id == postUserId)) {
                      return const Text('Followed');
                    }
                    return const SizedBox();
                  },
                )
              : const SizedBox(),
        ],
      ),
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
                postUserId: postUserId,
              ),
            )).then((value) => refetchGlobal!());
      },
    );
