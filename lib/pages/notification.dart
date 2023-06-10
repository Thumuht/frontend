import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/components/message.dart';
import 'package:thumuht/model/gql/graphql_api.graphql.dart';
import 'package:thumuht/model/session.dart';
import 'package:thumuht/pages/login.dart';
import 'package:thumuht/message_list.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final messageList =
        Provider.of<MessageList>(context, listen: true).toList();
    return Provider.of<Session>(context).login_
        ? Scaffold(
            body: SafeArea(
                child: messageList.length > 0
                    ? ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 24.0),
                        children: messageList
                            .map((e) => MessageItem(
                                id: e.id,
                                content: e.content,
                                senderId: e.senderId))
                            .toList())
                    : const Center(child: Text('No message'))))
        : const LoginPage();
  }
}
