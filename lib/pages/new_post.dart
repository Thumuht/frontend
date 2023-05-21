import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

import '../model/session.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  String? title_;
  String? content_;

  bool _checkParams() => (title_ != null) && (content_ != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          const SizedBox(height: 40.0),
          TextField(
            onChanged: (value) {
              title_ = value;
            },
            decoration: const InputDecoration(
              filled: true,
              labelText: 'title',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            onChanged: (value) {
              content_ = value;
            },
            decoration: const InputDecoration(
              filled: true,
              labelText: 'content',
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => {context.pop()},
              ),
              Mutation(
                options: MutationOptions(
                  document: NEW_POST_MUTATION_DOCUMENT,
                ),
                builder: (runMutation, result) => ElevatedButton(
                  onPressed: () {
                    if (_checkParams()) {
                      // print userId_
                      print(Provider.of<Session>(context, listen: false)
                          .userId_
                          .toString());
                      runMutation({
                        'userId': Provider.of<Session>(context, listen: false)
                            .userId_
                            .toString(),
                        'title': title_,
                        'content': content_,
                      });
                    }

                    context.replace('/');
                  },
                  child: const Text('Post'),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
