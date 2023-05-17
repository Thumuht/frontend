import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/session.dart';
import 'package:thumuht/pages/favorite.dart';
import 'package:thumuht/pages/login.dart';
import 'package:thumuht/pages/notification.dart';
import 'package:thumuht/pages/post_list.dart';
import 'package:thumuht/components/navigation_bottombar.dart';
import 'package:thumuht/pages/profile.dart';

// Homepage of thumuht
// This screen manages 4 distinct pages
// 0. post list
// 1. favorites
// 2. about me (login required)
// 3. notification (login required)
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title_});

  final String title_;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex_ = 0;
  late Widget page_ = const PostListPage();
  bool login_ = false;

  // this function is called when user clicks an icon in bottom navigation bar.
  void _handleBottomChanged(int newValue) {
    setState(() {
      selectedIndex_ = newValue;
      login_ = Provider.of<Session>(context, listen: false).login_;
      switch (selectedIndex_) {
        case 0:
          page_ = const PostListPage();
          break;
        case 1:
          page_ = const FavoritePage();
          break;
        case 2:
          page_ = login_ ? const ProfilePage() : const LoginPage();
          break;
        case 3:
          page_ = const NotificationPage();
          break;
        default:
          page_ = const Placeholder();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title_),
          ),
          body: Row(
            children: [
              Expanded(
                child: page_,
              ),
            ],
          ),
          bottomNavigationBar: NavBottomBar(
            onChanged: _handleBottomChanged,
            selectedIndex: selectedIndex_,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.push('/newpost');
            },
            tooltip: 'New Post',
            child: const Icon(Icons.add),
          ));
    });
  }
}
