import 'package:flutter/material.dart';

class NavBottomBar extends StatelessWidget {
  const NavBottomBar(
      {super.key, this.selectedIndex = 0, required this.onChanged});

  final ValueChanged<int> onChanged;
  final int selectedIndex;

  void _handleTap(int selectIndex) => onChanged(selectIndex);

  @override
  Widget build(BuildContext context) => SafeArea(
          child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'about me'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
        ],
        currentIndex: selectedIndex,
        onTap: _handleTap,
        type: BottomNavigationBarType.fixed,
      ));
}
