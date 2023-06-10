import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/gql/graphql_api.graphql.dart';

import 'model/session.dart';

class Message {
  Message({required this.id, required this.content, required this.senderId});
  int id;
  String content;
  int senderId;
}

class MessageList extends ChangeNotifier {
  Map<int, Message> messages = {};
  GraphQLClient? client;
  Stream<QueryResult<Object?>>? subscription;
  StreamSubscription<QueryResult<Object?>>? listener;
  void addMessage(Message message) {
    messages[message.id] = message;
    print('added message ${message.content}, id: ${message.id}');
    notifyListeners();
  }

  List<Message> toList() {
    final result = messages.values.toList();
    result.sort((a, b) => b.id - a.id);
    return result;
  }

  void removeMessage(int id) {
    messages.remove(id);
    notifyListeners();
  }

  void setClient(GraphQLClient client, String token) {
    this.client = client;
    subscription = this.client!.subscribe(SubscriptionOptions(
          document: RECEIVE_MESSAGE_SUBSCRIPTION_DOCUMENT,
          variables: {'token': token},
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          errorPolicy: ErrorPolicy.all,
        ));

    listener = subscription!.listen((event) {
      if (event.hasException) {
        print(event.exception.toString());
        return;
      }
      final message =
          ReceiveMessage$Subscription.fromJson(event.data!).messageToMe;
      print(message);
      addMessage(Message(
          id: message.messageId,
          content: message.content,
          senderId: message.userFrom));
    }, onDone: () {
      print('done');
      setClient(client, token);
    }, onError: (error) {
      print(error.toString());
    });
  }

  void stopSubscription() {
    client = null;
    subscription = null;
    listener?.cancel();
    listener = null;
  }

  void clear() {
    messages.clear();
    notifyListeners();
  }
}
