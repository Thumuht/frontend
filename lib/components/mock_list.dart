// haha, not a real list...
import 'package:flutter/material.dart';
import 'package:thumuht/pages/detail.dart';

Widget mockList(BuildContext context) => _buildList(context);

// only a list for placeholder purpose
Widget _buildList(BuildContext context) => ListView(
      children: [
        _tile('thumuht considered harmful', 'so it was.', context),
        _tile('UNIX considered harmful', 'but linux is not?..', context),
        _tile('action games and 3d games considered harmful', 'i agree.',
            context),
        _tile(
            'genesis',
            '## first chapter\n <img width="250" height="250" src="http://10.0.2.2:8899/fs/a.webp"/> In the beginning **God** created the heavens and the earth.'
                'Now the earth was formless and *empty*, darkness was over the surface of '
                'the deep, and the Spirit of God was hovering over the waters\n'
                '<video src="http://10.0.2.2:8899/fs/test.mp4">',
            context),
        _tile(
            'exorus',
            'These are the names of the sons of Israel who went to'
                ' Egypt with Jacob, each with his family',
            context)
      ],
    );

ListTile _tile(String title, String subtitle, BuildContext context) => ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                id: 1,
                title: title,
                content: subtitle,
                like: 0,
                commentsNum: 0,
                position: 'thumuht',
              ),
            ));
      },
    );
