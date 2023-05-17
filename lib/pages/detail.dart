import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title, required this.content});

  final String title;
  final String content;

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
          ],
        ),
      );
}
