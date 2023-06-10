// ignore_for_file: prefer_final_fields, camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/components/custom_node.dart';
import 'package:thumuht/components/video.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:thumuht/model/session.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

import 'dart:developer' as developer;

import '../main.dart';

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
  LikeWidget(
      {Key? key,
      required this.like,
      required this.postId,
      required this.userId})
      : super(key: key);
  int like;
  final int postId;
  final dynamic userId;

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  Like _likeNum = Like(likeNum: 0);
  bool _isLiked = false;
  @override
  void initState() {
    super.initState();
    if (Provider.of<Session>(context, listen: false).login_ == true) {
      if (likeMap[widget.userId] == null) {
        likeMap[widget.userId] = [];
      }
      _isLiked = likeMap[widget.userId]!.contains(widget.postId);
      developer.log('list: ${likeMap[widget.userId]}');
    }
    _likeNum.addListener(() {});
    _likeNum.changeLike(widget.like);
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
                        runMutation({'postId': widget.postId});
                        _likeNum.notLike();
                        likeMap[widget.userId]!.remove(widget.postId);
                        developer.log(likeMap.toString());
                      } else {
                        runMutation({'postId': widget.postId}).networkResult;
                        // print(l.toString());
                        _likeNum.addLike();
                        likeMap[widget.userId]!.add(widget.postId);
                      }
                      _isLiked = !_isLiked;
                      developer.log(likeMap.toString());
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
                            duration: Duration(seconds: 1),
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
              ],
            );
          }),
    ]);
  }
}

class MarkPost extends StatefulWidget {
  MarkPost({Key? key, required this.postId, required this.userId})
      : super(key: key);
  final int postId;
  final dynamic userId;
  @override
  _MarkPostState createState() => _MarkPostState();
}

class _MarkPostState extends State<MarkPost> {
  bool marked = false;
  @override
  void initState() {
    super.initState();
    if (Provider.of<Session>(context, listen: false).login_ == true) {
      if (markMap[widget.userId] == null) {
        markMap[widget.userId] = [];
      }
      marked = likeMap[widget.userId]!.contains(widget.postId);
    }

    developer.log('list: ${likeMap[widget.userId]}');
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: marked
            ? MutationOptions(document: MARK_MUTATION_DOCUMENT)
            : MutationOptions(document: UNMARK_MUTATION_DOCUMENT),
        builder: (runMutation, result) => IconButton(
              icon: Icon(marked ? Icons.bookmark_border : Icons.bookmark),
              onPressed: () {
                setState(() {
                  if (marked) {
                    runMutation({'postId': widget.postId});
                  } else {
                    runMutation({'postId': widget.postId});
                  }
                  marked = !marked;
                });
              },
            ));
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.id,
      required this.title,
      required this.content,
      required this.like,
      required this.commentsNum,
      required this.position});
  final int id;
  final String title;
  final String content;
  final int like;
  final int commentsNum;
  final String position;

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
                Column(
                    children: MarkdownGenerator(
                  generators: [videoGeneratorWithTag],
                  textGenerator: (node, config, visitor) =>
                      CustomTextNode(node.textContent, config, visitor),
                ).buildWidgets(content)),
                const SizedBox(height: 20),
                if (position.isNotEmpty)
                  Text(
                    "位置：$position",
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LikeWidget(
                        like: like,
                        postId: id,
                        userId: Provider.of<Session>(context, listen: false)
                            .userId_),
                    CommentsNumShow(commentsNum: commentsNum),
                    MarkPost(
                      postId: id,
                      userId:
                          Provider.of<Session>(context, listen: false).userId_,
                    ),
                    sharePost(title, content),
                  ],
                ),
                showComments(
                    postId: id,
                    userId:
                        Provider.of<Session>(context, listen: false).userId_),
              ],
            ),
          ));
          
  Future<void> shareMsg(String msg) async {
    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    response = await flutterShareMe.shareToSystem(msg: msg);
  }

  Widget sharePost(String title, String content) {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: () {
        shareMsg('$title\n$content');
      },
    );
  }
}
