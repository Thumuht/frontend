// haha, not a real list...
import 'package:flutter/material.dart';

Widget mockList() {
  return _buildList();
}

// only a list for placeholder purpose
Widget _buildList() {
  return ListView(
    children: [
      _tile('thumuht considered harmful', 'so it was.'),
      _tile('UNIX considered harmful', 'but linux is not?..'),
      _tile('action games and 3d games considered harmful', 'i agree.'),
    ],
  );
}

ListTile _tile(String title, String subtitle) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    ),
    subtitle: Text(subtitle),
  );
}
