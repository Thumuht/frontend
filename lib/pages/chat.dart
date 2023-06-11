import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/components/message.dart';
import 'package:thumuht/message_list.dart';
import 'package:thumuht/model/gql/graphql_api.graphql.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.toUserId}) : super(key: key);

  final int toUserId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(GraphQLClient client, Refetch refetch) async {
    final content = _textController.text;
    if (content == '') {
      return;
    }
    _textController.clear();
    final result = await client.mutate(MutationOptions(
        document: SEND_MESSAGE_MUTATION_DOCUMENT,
        variables: {'toId': widget.toUserId, 'content': content}));
    if (result.hasException) {
      print(result.exception.toString());
      return;
    }
    refetch();

    Future.delayed(const Duration(milliseconds: 50), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
          document: MESSAGE_NUM_QUERY_DOCUMENT,
          variables: {'id': widget.toUserId}),
      builder: (result, {fetchMore, refetch}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }
        if (result.isLoading || result.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final messageCount = MessageNum$Query.fromJson(result.data!).messageNum;
        final outerRefetch = refetch;
        Provider.of<MessageList>(context, listen: false).addListener(() {
          outerRefetch!();
        });
        return Query(
          options: QueryOptions(
              document: GET_USER_BY_ID_QUERY_DOCUMENT,
              variables: {'id': widget.toUserId}),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading || result.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final user = GetUserById$Query.fromJson(result.data!).getUserById;
            return Query(
              options: QueryOptions(document: GET_PROFILE_QUERY_DOCUMENT),
              builder: (result, {fetchMore, refetch}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }
                if (result.isLoading || result.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final me = GetProfile$Query.fromJson(result.data!).me;
                return Query(
                  options: QueryOptions(
                      document: GET_MESSAGES_QUERY_DOCUMENT,
                      variables: {
                        'userId': widget.toUserId,
                        'offset': 0,
                        'limit': messageCount
                      }),
                  builder: (result, {fetchMore, refetch}) {
                    if (result.hasException) {
                      return Text(result.exception.toString());
                    }
                    if (result.isLoading || result.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final messages =
                        GetMessages$Query.fromJson(result.data!).myMessage;

                    messages.sort((a, b) => a.messageId - b.messageId);

                    for (final message in messages) {
                      if (message.userFrom == widget.toUserId) {
                        Provider.of<MessageList>(context, listen: false)
                            .removeMessageWithoutNotify(message.messageId);
                      }
                    }

                    Future.delayed(const Duration(milliseconds: 50), () {
                      _scrollController
                          .jumpTo(_scrollController.position.maxScrollExtent);
                    });

                    return Scaffold(
                        appBar: AppBar(
                          title: Query(
                            options: QueryOptions(
                                document: GET_USER_BY_ID_QUERY_DOCUMENT,
                                variables: {'id': widget.toUserId}),
                            builder: (result, {fetchMore, refetch}) {
                              final user =
                                  GetUserById$Query.fromJson(result.data!)
                                      .getUserById;
                              return Text(
                                  'Chat with ${user.nickname == '' ? user.loginName : user.nickname!}');
                            },
                          ),
                          // a button to return to the previous page
                          leading: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Provider.of<MessageList>(context, listen: false)
                                  .notify();
                              context.pop();
                            },
                          ),
                        ),
                        //a widget to send message at bottom
                        bottomNavigationBar: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _textController,
                                  decoration: const InputDecoration(
                                    hintText: 'Type a message',
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  // send message
                                  _sendMessage(
                                      GraphQLProvider.of(context).value,
                                      outerRefetch!);
                                },
                              )
                            ],
                          ),
                        ),
                        body: ListView(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 24.0,
                            ),
                            controller: _scrollController,
                            children: messages
                                .map((e) => ChatMessage(
                                      avatar: e.userFrom == widget.toUserId
                                          ? user.avatar!
                                          : me.avatar!,
                                      content: e.content,
                                      isMe: e.userFrom != widget.toUserId,
                                      senderId: e.userFrom,
                                    ))
                                .toList()));
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
