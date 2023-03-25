import 'package:flutter/material.dart';
import 'package:thumuht/model/post.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.p});

  final Post p;
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
              p.title,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                p.content,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      );
}
