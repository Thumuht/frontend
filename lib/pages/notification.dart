import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/session.dart';
import 'package:thumuht/pages/login.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    // get login status from provider
    return Provider.of<Session>(context).login_
        ? const Text('Notification')
        : const LoginPage();
  }
}
