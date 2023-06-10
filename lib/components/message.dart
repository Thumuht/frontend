import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/gql/graphql_api.graphql.dart';

import '../main.dart';
import '../message_list.dart';

class MessageItem extends StatefulWidget {
  const MessageItem({
    Key? key,
    required this.id,
    required this.content,
    required this.senderId,
  }) : super(key: key);

  final int id;
  final String content;
  final int senderId;

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
            document: GET_USER_BY_ID_QUERY_DOCUMENT,
            variables: <String, dynamic>{
              'id': widget.senderId,
            }),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading || result.data == null) {
            return const Text('Loading...');
          }

          final user = GetUserById$Query.fromJson(result.data!).getUserById;

          return GestureDetector(
            onTap: () {
              context.push('/chat', extra: {'toUserId': widget.senderId});
              Provider.of<MessageList>(context, listen: false)
                  .removeMessage(widget.id);
            },
            child: Row(
              children: [
                user.avatar == ''
                    ? Image.asset(
                        'assets/thumuht.jpg',
                        width: 50,
                        height: 50,
                      )
                    : Image.network(
                        '$backendAddress/fs/${user.avatar}',
                        width: 50,
                        height: 50,
                      ),
                const SizedBox(
                  width: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.nickname == null || user.nickname == ''
                          ? user.loginName
                          : user.nickname!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.content,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class ChatMessage extends StatefulWidget {
  const ChatMessage({
    Key? key,
    required this.avatar,
    required this.content,
    required this.isMe,
  }) : super(key: key);

  final String avatar;
  final String content;
  final bool isMe;

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        widget.isMe
            ? const SizedBox()
            : widget.avatar == ''
                ? Image.asset(
                    'assets/thumuht.jpg',
                    width: 50,
                    height: 50,
                  )
                : Image.network(
                    '$backendAddress/fs/${widget.avatar}',
                    width: 50,
                    height: 50,
                  ),
        const SizedBox(
          width: 16.0,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 200),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: widget.isMe ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            widget.content,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
