import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

class LikeWidget extends StatefulWidget {
  LikeWidget({Key? key, required this.like, required this.id})
      : super(key: key);
  int like;
  final int id;

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Mutation(
            options: _isLiked
                ? MutationOptions(document: DISLIKE_MUTATION_DOCUMENT)
                : MutationOptions(document: LIKE_MUTATION_DOCUMENT),
            builder: (runMutation, result) => IconButton(
                  icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      if (_isLiked) {
                        runMutation({'postId': widget.id});
                        widget.like--;
                      } else {
                        runMutation({'postId': widget.id});
                        widget.like++;
                      }
                      _isLiked = !_isLiked;
                    });
                  },
                )),
        Text('${widget.like}'),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.id,
      required this.title,
      required this.content,
      required this.like,
      required this.commentsNum});
  final int id;
  final String title;
  final String content;
  final int like;
  final int commentsNum;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('thumuht'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 20),
            Markdown(
              shrinkWrap: true,
              data: content,
              imageDirectory: "http://localhost:8899/fs/",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LikeWidget(like: like, id: id),
                Text('Comments: $commentsNum'),
              ],
            ),
          ],
        ),
      );
}
