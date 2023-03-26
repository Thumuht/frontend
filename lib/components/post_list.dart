import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/pages/detail.dart';

Widget trueList(BuildContext context) => _buildList(context);

// post list.
Widget _buildList(BuildContext context) => Query(
      options: QueryOptions(document: GetPostListsQuery().document),
      builder: (result, {fetchMore, refetch}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }
        if (result.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final postlists = GetPostLists$Query.fromJson(result.data!).posts;
        return ListView.builder(
          itemBuilder: (context, index) {
            return _tile(
                postlists[index].title!, postlists[index].content!, context);
          },
          itemCount: postlists.length,
        );
      },
    );

ListTile _tile(String title, String subtitle, BuildContext context) => ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                title: title,
                content: subtitle,
              ),
            ));
      },
    );
