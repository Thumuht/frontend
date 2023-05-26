// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/model/session.dart';

class Like extends ChangeNotifier {
  //这里也可以使用with来进行实现
  Like({required this.likeNum});
  int likeNum;

  int get getLikeNum => likeNum;

  changeLike(int like) {
    likeNum = like;
    notifyListeners();
  }

  addLike() {
    likeNum++;
    notifyListeners();
  }

  notLike() {
    likeNum--;
    notifyListeners();
  }
}

class Comment extends ChangeNotifier {
  Comment({required this.commentsNum});
  int commentsNum;
  int get getCommentsNum => commentsNum;
  changeCommentNum(int commentsNum) {
    commentsNum = commentsNum;
    notifyListeners();
  }

  addCommentNum() {
    commentsNum++;
    notifyListeners();
  }

  notCommentNum() {
    commentsNum--;
    notifyListeners();
  }
}

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
  Like _likeNum = Like(likeNum: 0);

  @override
  void initState() {
    super.initState();
    _likeNum.addListener(() {});
    _likeNum.changeLike(widget.like);
    _isLiked = false;
  }

  @override
  void dispose() {
    _likeNum.removeListener(() {});
    super.dispose();
  }

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
                        _likeNum.notLike();
                      } else {
                        runMutation({'postId': widget.id});
                        _likeNum.addLike();
                      }
                      _isLiked = !_isLiked;
                    });
                  },
                )),
        Text('${_likeNum.getLikeNum}'),
      ],
    );
  }
}

class CommentsNumShow extends StatefulWidget {
  CommentsNumShow({Key? key, required this.commentsNum}) : super(key: key);
  int commentsNum;
  @override
  _CommentsNumShowState createState() => _CommentsNumShowState();
}

class _CommentsNumShowState extends State<CommentsNumShow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.comment_bank_outlined),
        const SizedBox(width: 10),
        Consumer<Comment>(builder: (context, comment, child) {
          return Text('${comment.getCommentsNum}');
        })
      ],
    );
  }
}

VoidCallback? refetchGlobal;

class showComments extends StatefulWidget {
  showComments({Key? key, required this.postId, required this.userId})
      : super(key: key);
  final int postId;
  final dynamic userId;
  @override
  _showCommentsState createState() => _showCommentsState();
}

class _showCommentsState extends State<showComments> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: '请输入评论',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Mutation(
              options: MutationOptions(document: NEW_COMMENT_MUTATION_DOCUMENT),
              builder: (runMutation, result) => TextButton(
                    onPressed: () {
                      if (widget.userId == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('请先登录'),
                          ),
                        );
                      } else {
                        runMutation({
                          'userId': widget.userId,
                          'postId': widget.postId,
                          'content': _controller.text
                        });
                        Provider.of<Comment>(context, listen: false)
                            .addCommentNum();
                        _controller.clear();
                        refetchGlobal!();
                      }
                    },
                    child: const Text('评论'),
                  )),
        ],
      ),
      const SizedBox(height: 10),
      Query(
          options: QueryOptions(
              document: GET_COMMENT_LISTS_QUERY_DOCUMENT, variables: {}),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            refetchGlobal = refetch;
            final comments = result.data?['comment'] as List<dynamic>;
            comments.retainWhere(
                (comment) => comment['post']['id'] == widget.postId);
            return Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(comments[index]['content']),
                        subtitle: Text(comments[index]['user']['loginName']),
                      );
                    }),
                // IconButton(
                //     onPressed: () {
                //       refetch!();
                //     },
                //     icon: const Icon(Icons.refresh))
              ],
            );
          }),
    ]);
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
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => Comment(commentsNum: commentsNum))
          ],
          child: Scaffold(
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
                    CommentsNumShow(commentsNum: commentsNum),
                  ],
                ),
                showComments(
                    postId: id,
                    userId:
                        Provider.of<Session>(context, listen: false).userId_),
              ],
            ),
          ));
}
