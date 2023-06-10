import 'package:flutter/material.dart';
import 'package:thumuht/components/mark_list.dart';
import 'package:thumuht/components/mock_list.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) => markList(context);
}