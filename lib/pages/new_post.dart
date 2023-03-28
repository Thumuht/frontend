import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

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
            obscureText: true,
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
                      runMutation({
                        'userId': 1,
                        'title': title_,
                        'content': content_,
                      });
                    }
                    // context.pop();
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
